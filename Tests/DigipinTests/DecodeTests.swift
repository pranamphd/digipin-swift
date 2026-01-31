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

final class DecodeTests: XCTestCase {

    func testDecodeAcceptsLowercaseAndSeparators() {
        XCTAssertNoThrow(
            try decode("2c3-4k5-pft9"),
            "Decoder should accept lowercase input and separator characters"
        )
    }

    func testDecodeAcceptsFormattedDigipin() {
        XCTAssertNoThrow(
            try decode("2c3-4km-pft9"),
            "Decoder should accept user-formatted DIGIPIN strings"
        )
    }

    func testDecodeRejectsInvalidSymbols() {
        let invalidDigipins = [
            "39J49YL8T4",  // contains invalid symbol
            "A4D-SK2-S7Z5",  // multiple invalid symbols
        ]

        for digipin in invalidDigipins {
            XCTAssertThrowsError(
                try decode(digipin),
                "Decoder must reject DIGIPIN with invalid symbols: \(digipin)"
            ) { error in
                XCTAssertTrue(error is DigipinError)
            }

        }
    }

    func testDecodeEncodeDecodeIsStable() throws {
        let digipin = "39J49LL8T4"

        let decoded = try decode(digipin)
        let encoded = try encode(decoded)
        let redecoded = try decode(encoded)

        XCTAssertEqual(
            decoded,
            redecoded,
            "decode → encode → decode must be stable and lossless"
        )
    }
}
