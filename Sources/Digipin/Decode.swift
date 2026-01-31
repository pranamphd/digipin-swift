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

/// Decode a DIGIPIN into geodetic coordinates.
///
/// This function reverses the hierarchical DIGIPIN grid encoding process and derives the geographic centroid of the represented grid cell.
///
/// - Parameter digipin: DIGIPIN string to decode. Separator characters are allowed and case is ignored.
/// - Returns: A ``Location`` representing the centroid latitude and longitude in decimal degrees using the WGS-84 coordinate system.
/// - Throws:
///     - ``DigipinError/invalidDigipinLength``
///     - ``DigipinError/invalidDigipinFormat``
public func decode(_ digipin: String) throws -> Location {
    let normalized = normalize(digipin)
    try validateDigipinFormat(normalized)

    var latitudeMin = DIGIPIN_LATITUDE_MIN
    var latitudeMax = DIGIPIN_LATITUDE_MAX
    var longitudeMin = DIGIPIN_LONGITUDE_MIN
    var longitudeMax = DIGIPIN_LONGITUDE_MAX

    for symbol in normalized {
        guard let (row, column) = DIGIPIN_SYMBOL_TO_INDEX[symbol] else {
            throw DigipinError.invalidDigipinFormat
        }

        let latitudeStep = (latitudeMax - latitudeMin) / Double(DIGIPIN_GRID_SIZE)
        let longitudeStep = (longitudeMax - longitudeMin) / Double(DIGIPIN_GRID_SIZE)

        latitudeMax -= Double(row) * latitudeStep
        latitudeMin = latitudeMax - latitudeStep

        longitudeMin += Double(column) * longitudeStep
        longitudeMax = longitudeMin + longitudeStep
    }

    return Location(
        latitude: (latitudeMin + latitudeMax) / 2.0,
        longitude: (longitudeMin + longitudeMax) / 2.0
    )
}
