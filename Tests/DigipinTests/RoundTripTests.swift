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

/// Tests encode → decode round-trip accuracy within specification tolerance.
final class RoundTripTests: XCTestCase {

    func testRoundtripAcrossMultipleLocations() throws {
        let locations: [Location] = [
            Location(latitude: 2.5, longitude: 63.5),
            Location(latitude: 28.622788, longitude: 77.213033),
            Location(latitude: 38.5, longitude: 99.5)
        ]

        for location in locations {
            let digipin = try encode(location)
            let decoded = try decode(digipin)

            let latitudeError =
                abs(decoded.latitude - location.latitude)
            let longitudeError =
                abs(decoded.longitude - location.longitude)

            XCTAssertLessThanOrEqual(
                latitudeError,
                DIGIPIN_MAX_DECODE_ERROR_DEGREES,
                "Latitude error exceeds tolerance for location: \(location)"
            )

            XCTAssertLessThanOrEqual(
                longitudeError,
                DIGIPIN_MAX_DECODE_ERROR_DEGREES,
                "Longitude error exceeds tolerance for location: \(location)"
            )
        }
    }
}
