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

final class ValidationTests: XCTestCase {

    // MARK: - Geodetic validation

    func testAcceptsValidGeodeticCoordinates() {
        XCTAssertNoThrow(
            try validateGeodeticCoordinates(
                Location(latitude: 28.6, longitude: 77.2)
            )
        )
    }

    func testAcceptsExactGeodeticBoundaries() {
        XCTAssertNoThrow(
            try validateGeodeticCoordinates(
                Location(
                    latitude: GEODETIC_LATITUDE_MIN,
                    longitude: GEODETIC_LONGITUDE_MIN
                )
            )
        )

        XCTAssertNoThrow(
            try validateGeodeticCoordinates(
                Location(
                    latitude: GEODETIC_LATITUDE_MAX,
                    longitude: GEODETIC_LONGITUDE_MAX
                )
            )
        )
    }

    func testRejectsInvalidLatitude() {
        XCTAssertThrowsError(
            try validateGeodeticCoordinates(
                Location(latitude: 120.0, longitude: 77.0)
            )
        ) { error in
            XCTAssertEqual(error as? DigipinError, .invalidLatitude)
        }
    }

    func testRejectsInvalidLongitude() {
        XCTAssertThrowsError(
            try validateGeodeticCoordinates(
                Location(latitude: 28.0, longitude: 200.0)
            )
        ) { error in
            XCTAssertEqual(error as? DigipinError, .invalidLongitude)
        }
    }

    // MARK: - Territory validation

    func testRejectsOutsideTerritory() {
        XCTAssertThrowsError(
            try validateDigipinTerritory(
                Location(latitude: 51.5, longitude: -0.1)
            )
        ) { error in
            XCTAssertEqual(error as? DigipinError, .outsideSupportedTerritory)
        }
    }

    // MARK: - DIGIPIN format validation

    func testAcceptsValidDigipinFormat() {
        XCTAssertNoThrow(
            try validateDigipinFormat("39J49LL8T4")
        )
    }

    func testRejectsUnnormalizedDigipin() {
        XCTAssertThrowsError(
            try validateDigipinFormat("39J-49L-L8T4")
        ) { error in
            XCTAssertEqual(error as? DigipinError, .invalidDigipinLength)
        }
    }

    func testRejectsInvalidLength() {
        XCTAssertThrowsError(
            try validateDigipinFormat("39J")
        ) { error in
            XCTAssertEqual(error as? DigipinError, .invalidDigipinLength)
        }
    }

    func testRejectsInvalidSymbols() {
        XCTAssertThrowsError(
            try validateDigipinFormat("34SUYDV5GH")
        ) { error in
            XCTAssertEqual(error as? DigipinError, .invalidDigipinFormat)
        }
    }
}
