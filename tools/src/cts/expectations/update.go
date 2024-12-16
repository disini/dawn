// Copyright 2022 The Dawn & Tint Authors
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived from
//    this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

package expectations

import (
	"fmt"
	"strings"
	"time"

	"dawn.googlesource.com/dawn/tools/src/container"
	"dawn.googlesource.com/dawn/tools/src/cts/query"
	"dawn.googlesource.com/dawn/tools/src/cts/result"
)

const (
	// Chunk comment for the AddExpectationsForFailingResults path.
	ROLLER_AUTOGENERATED_FAILURES = "# ##ROLLER_AUTOGENERATED_FAILURES##"
)

// AddExpectationsForFailingResults adds new expectations for the provided
// failing results, with the assumption that the provided results do not
// have existing expectations.
//
// This will:
//   - Remove expectations for non-existent tests.
//   - Reduce result tags down to only the most explicit tag from each set
//   - Merge identical results together
//   - Add new expectations to the one mutable chunk that is expected to
//     be present in the file.
//   - Sort the mutable chunk's expectations by test name, then tags.
//
// TODO(crbug.com/372730248): Return diagnostics.
func (c *Content) AddExpectationsForFailingResults(results result.List,
	testlist []query.Query, verbose bool) error {
	// Make a copy of the results. This code mutates the list.
	results = append(result.List{}, results...)

	startTime := time.Now()
	// TODO(crbug.com/372730248): Do this once (instead of every patchset) and/or
	// find a way to optimize this. This currently takes ~99% of the result
	// processing time.
	if err := c.removeExpectationsForUnknownTests(&testlist); err != nil {
		return err
	}
	if verbose {
		fmt.Printf("Removing unknown expectations took %s\n", time.Now().Sub(startTime).String())
	}

	startTime = time.Now()
	if err := c.removeUnknownTags(&results); err != nil {
		return err
	}
	if verbose {
		fmt.Printf("Removing unknown tags took %s\n", time.Now().Sub(startTime).String())
	}

	startTime = time.Now()
	if err := c.reduceTagsToMostExplicitOnly(&results); err != nil {
		return err
	}
	if verbose {
		fmt.Printf("Reducing tags took %s\n", time.Now().Sub(startTime).String())
	}

	// Merge identical results.
	startTime = time.Now()
	results = result.Merge(results)
	if verbose {
		fmt.Printf("Merging identical results took %s\n", time.Now().Sub(startTime).String())
	}

	startTime = time.Now()
	if err := c.addExpectationsToMutableChunk(&results); err != nil {
		return err
	}
	if verbose {
		fmt.Printf("Adding expectations took %s\n", time.Now().Sub(startTime).String())
	}
	return nil
}

// removeExpectationsForUnknownTests modifies the Content in place so that all
// contained Expectations apply to tests in the given testlist.
func (c *Content) removeExpectationsForUnknownTests(testlist *[]query.Query) error {
	// Converting into a set allows us to much more efficiently check if a
	// non-wildcard expectation is for a valid test.
	knownTestNames := container.NewSet[string]()
	for _, testQuery := range *testlist {
		knownTestNames.Add(testQuery.ExpectationFileString())
	}

	prunedChunkSlice := make([]Chunk, 0)
	for _, chunk := range c.Chunks {
		prunedChunk := chunk.Clone()
		// If we don't have any expectations already, just add the chunk back
		// immediately to avoid removing comments, especially the header.
		if prunedChunk.IsCommentOnly() {
			prunedChunkSlice = append(prunedChunkSlice, prunedChunk)
			continue
		}

		prunedChunk.Expectations = make(Expectations, 0)
		for _, expectation := range chunk.Expectations {
			// We don't actually parse the query string into a Query since wildcards
			// are treated differently between expectations and CTS queries.
			if strings.HasSuffix(expectation.Query, "*") {
				testPrefix := expectation.Query[:len(expectation.Query)-1]
				for testName := range knownTestNames {
					if strings.HasPrefix(testName, testPrefix) {
						prunedChunk.Expectations = append(prunedChunk.Expectations, expectation)
						break
					}
				}
			} else {
				if knownTestNames.Contains(expectation.Query) {
					prunedChunk.Expectations = append(prunedChunk.Expectations, expectation)
				}
			}
		}

		if len(prunedChunk.Expectations) > 0 {
			prunedChunkSlice = append(prunedChunkSlice, prunedChunk)
		}
	}

	c.Chunks = prunedChunkSlice
	return nil
}

// removeUnknownTags modifies |results| in place so that the Results contained
// within it only use tags that the Content is aware of.
func (c *Content) removeUnknownTags(results *result.List) error {
	*results = results.TransformTags(func(t result.Tags) result.Tags {
		filtered := result.NewTags()
		for tag := range t {
			if _, ok := c.Tags.ByName[tag]; ok {
				filtered.Add(tag)
			}
		}
		return filtered
	})
	return nil
}

// reduceTagsToMostExplicitOnly modifies the given results argument in place
// so that all contained results' tag sets only contain the most explicit tags
// based on the known tag sets contained within the Content.
func (c *Content) reduceTagsToMostExplicitOnly(results *result.List) error {
	for i, res := range *results {
		res.Tags = c.Tags.RemoveLowerPriorityTags(res.Tags)
		(*results)[i] = res
	}
	return nil
}

// addExpectationsToMutableChunk adds expectations for the results contained
// within |results| to the one mutable chunk that  should be in the Content.
// If not found, a new one will be created at the end of the Content.
func (c *Content) addExpectationsToMutableChunk(results *result.List) error {
	// Find the mutable chunk.
	// Chunks are considered immutable by default, unless annotated as
	// ROLLER_AUTOGENERATED_FAILURES.
	mutableTokens := []string{
		ROLLER_AUTOGENERATED_FAILURES,
	}

	// Bin the chunks into those that contain any of the strings in
	// mutableTokens in the comments and those that do not have these strings.
	immutableChunkIndicies, mutableChunkIndices := []int{}, []int{}
	for i, chunk := range c.Chunks {
		immutable := true

	comments:
		for _, line := range chunk.Comments {
			for _, token := range mutableTokens {
				if strings.Contains(line, token) {
					immutable = false
					break comments
				}
			}
		}

		if immutable {
			immutableChunkIndicies = append(immutableChunkIndicies, i)
		} else {
			mutableChunkIndices = append(mutableChunkIndices, i)
		}
	}

	var chunkToModify *Chunk
	if len(mutableChunkIndices) > 1 {
		return fmt.Errorf("Expected 1 mutable chunk, found %d", len(mutableChunkIndices))
	} else if len(mutableChunkIndices) == 0 {
		newChunk := Chunk{}
		newChunk.Comments = []string{
			"################################################################################",
			"# Autogenerated Failure expectations. Please triage.",
			ROLLER_AUTOGENERATED_FAILURES,
			"################################################################################",
		}
		c.Chunks = append(c.Chunks, newChunk)
		chunkToModify = &(c.Chunks[len(c.Chunks)-1])
	} else {
		chunkToModify = &(c.Chunks[mutableChunkIndices[0]])
	}

	// Add the new expectations to the mutable chunk.
	for _, res := range *results {
		expectation := Expectation{
			Bug:   "crbug.com/0000",
			Tags:  res.Tags,
			Query: res.Query.ExpectationFileString(),
			Status: []string{
				"Failure",
			},
		}
		chunkToModify.Expectations = append(chunkToModify.Expectations, expectation)
	}

	// Sort the mutable chunk's expectations.
	chunkToModify.Expectations.SortPrioritizeQuery()
	return nil
}
