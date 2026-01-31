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

/// Encode geographic coordinates into a canonical DIGIPIN.
///
/// This function implements the official DIGIPIN hierarchical 4 × 4 grid
/// encoding algorithm exactly as defined by the specification.
///
/// The returned DIGIPIN contains no separators and is always
/// exactly 10 characters long.
///
/// - Parameter location: Geographic location containing latitude and longitude
///   expressed in decimal degrees using the WGS-84 coordinate system.
/// - Returns: Encoded DIGIPIN string
/// - Throws:
///   - ``DigipinError/invalidLatitude``
///   - ``DigipinError/invalidLongitude``
///   - ``DigipinError/outsideSupportedTerritory``
public func encode(_ location: Location) throws -> String {
    try validateGeodeticCoordinates(location)
    try validateDigipinTerritory(location)

    var latitudeMin = DIGIPIN_LATITUDE_MIN
    var latitudeMax = DIGIPIN_LATITUDE_MAX
    var longitudeMin = DIGIPIN_LONGITUDE_MIN
    var longitudeMax = DIGIPIN_LONGITUDE_MAX

    var digipin = String()
    digipin.reserveCapacity(DIGIPIN_LENGTH)

    for _ in 0..<DIGIPIN_LENGTH {
        let latitudeStep =
            (latitudeMax - latitudeMin) / Double(DIGIPIN_GRID_SIZE)
        let longitudeStep =
            (longitudeMax - longitudeMin) / Double(DIGIPIN_GRID_SIZE)

        var rowIndex = Int((latitudeMax - location.latitude) / latitudeStep)
        var columnIndex = Int((location.longitude - longitudeMin) / longitudeStep)

        // Clamp row and column indices to valid grid bounds
        rowIndex = min(max(rowIndex, 0), DIGIPIN_GRID_SIZE - 1)
        columnIndex = min(max(columnIndex, 0), DIGIPIN_GRID_SIZE - 1)

        let symbol = DIGIPIN_LABEL_GRID[rowIndex][columnIndex]
        digipin.append(symbol)

        latitudeMax -= Double(rowIndex) * latitudeStep
        latitudeMin = latitudeMax - latitudeStep

        longitudeMin += Double(columnIndex) * longitudeStep
        longitudeMax = longitudeMin + longitudeStep
    }

    return digipin
}
