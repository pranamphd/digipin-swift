// SPDX-License-Identifier: Apache-2.0
//
// Copyright (c) 2026 Pranam
// ORCID: https://orcid.org/0009-0007-9316-3616
//
// This code is licensed under the Apache License, Version 2.0.
//
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0

import XCTest

@testable import Digipin

/// Tests for DIGIPIN string normalization (separator removal + uppercasing).
final class NormalizeTests: XCTestCase {

    func testRemovesSeparatorsAndUppercases() {
        XCTAssertEqual(
            "39J49LL8T4",
            normalize("39j-49l-l8t4"),
            "Normalization must remove separators and uppercase characters"
        )
    }

    func testDoesNotModifyNormalizedDigipin() {
        XCTAssertEqual(
            "39J49LL8T4",
            normalize("39J49LL8T4")
        )
    }

    func testKeepsNonSeparatorCharactersExceptCase() {
        XCTAssertEqual(
            "ABC",
            normalize("a-b-c")
        )
    }

    func testNormalizeHandlesMultipleSeparators() {
        XCTAssertEqual(
            "ABC",
            normalize("a--b---c")
        )
    }

    func testNormalizeEmptyString() {
        XCTAssertEqual(
            "",
            normalize("")
        )
    }

    func testNormalizePreservesDigits() {
        XCTAssertEqual(
            "1239",
            normalize("1-2-3-9")
        )
    }

    func testNormalizeDoesNotTrimWhitespace() {
        XCTAssertEqual(
            " A",
            normalize(" a")
        )
    }

    func testNormalizeDoesNotAlterUnicodeLetters() {
        XCTAssertEqual(
            "ÅBC",
            normalize("å-b-c")
        )
    }
}
