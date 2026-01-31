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

final class EncodeTests: XCTestCase {

    // MARK: - Validation & bounds

    func testEncodeRejectsOutsideTerritory() {
        let location = Location(latitude: 0.0, longitude: 0.0)

        XCTAssertThrowsError(try encode(location)) { error in
            XCTAssertEqual(error as? DigipinError, .outsideSupportedTerritory)
        }
    }

    func testBoundarySouthWest() {
        let location = Location(latitude: 2.5, longitude: 63.5)
        XCTAssertNoThrow(try encode(location))
    }

    func testBoundaryNorthEast() {
        let location = Location(latitude: 38.5, longitude: 99.5)
        XCTAssertNoThrow(try encode(location))
    }

    func testEncodeRejectsLatitudeBelowMin() {
        let location = Location(latitude: 2.48, longitude: 70.0)

        XCTAssertThrowsError(try encode(location)) { error in
            XCTAssertEqual(error as? DigipinError, .outsideSupportedTerritory)
        }
    }

    func testEncodeRejectsLongitudeAboveMax() {
        let location = Location(latitude: 20.0, longitude: 99.51)

        XCTAssertThrowsError(try encode(location)) { error in
            XCTAssertEqual(error as? DigipinError, .outsideSupportedTerritory)
        }
    }

    // MARK: - Determinism & invariants

    func testEncodeIsDeterministic() throws {
        let location = Location(latitude: 28.6, longitude: 77.2)
        let first = try encode(location)

        for _ in 0..<10 {
            XCTAssertEqual(first, try encode(location))
        }
    }

    func testEncodeAlwaysProducesCorrectLength() throws {
        let location = Location(latitude: 28.6, longitude: 77.2)
        let digipin = try encode(location)

        XCTAssertEqual(DIGIPIN_LENGTH, digipin.count)
    }

    // MARK: - Reversibility (spec property)

    func testEncodeDecodeRoundTripWithinErrorBounds() throws {
        let location = Location(latitude: 28.622788, longitude: 77.213033)
        let digipin = try encode(location)
        let decoded = try decode(digipin)

        XCTAssertLessThan(
            abs(decoded.latitude - location.latitude),
            DIGIPIN_MAX_DECODE_ERROR_DEGREES
        )
        XCTAssertLessThan(
            abs(decoded.longitude - location.longitude),
            DIGIPIN_MAX_DECODE_ERROR_DEGREES
        )
    }

    // MARK: - Known value (canary)

    func testEncodeKnownLocationProducesValidSymbols() throws {
        let location = Location(latitude: 28.622788, longitude: 77.213033)
        let digipin = try encode(location)

        XCTAssertEqual(
            digipin.count,
            DIGIPIN_LENGTH,
            "Encoded DIGIPIN must have fixed length"
        )

        for symbol in digipin {
            XCTAssertTrue(
                DIGIPIN_SYMBOLS.contains(symbol),
                "Encoded DIGIPIN contains invalid symbol: \(symbol)"
            )
        }
    }

}
