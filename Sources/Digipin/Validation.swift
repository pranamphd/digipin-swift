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

/// Validate geodetic latitude and longitude.
///
/// This function verifies that the latitude and longitude values fall
/// within the globally valid WGS-84 geodetic bounds.
///
/// - Parameter `location`: Geographic location containing latitude and longitude
/// expressed in decimal degrees.
///
/// - Throws:
///     - `DigipinError.invalidLatitude` if the latitude is outside the valid geodetic range.
///     - `DigipinError.invalidLongitude` if the longitude is outside the valid geodetic range.
func validateGeodeticCoordinates(_ location: Location) throws {
    if location.latitude < GEODETIC_LATITUDE_MIN || location.latitude > GEODETIC_LATITUDE_MAX {
        throw DigipinError.invalidLatitude
    }

    if location.longitude < GEODETIC_LONGITUDE_MIN || location.longitude > GEODETIC_LONGITUDE_MAX {
        throw DigipinError.invalidLongitude
    }
}

/// Validate that a geographic location lies within the supported DIGIPIN territory.
///
/// This function enforces territorial constraints beyond global geodetic bounds.
///
/// - Parameter `location`: Geographic location containing latitude and longitude
/// expressed in decimal degrees.
///
/// - Throws: `DigipinError.outsideSupportedTerritory` if either latitude or
/// longitude lies outside supported bounds.
func validateDigipinTerritory(_ location: Location) throws {
    if location.latitude < DIGIPIN_LATITUDE_MIN || location.latitude > DIGIPIN_LATITUDE_MAX
        || location.longitude < DIGIPIN_LONGITUDE_MIN || location.longitude > DIGIPIN_LONGITUDE_MAX
    {
        throw DigipinError.outsideSupportedTerritory
    }
}

/// Validate the structural format of a DIGIPIN string.
///
/// This function validates only the canonical DIGIPIN representation.
/// Input is expected to be normalized before validation.
///
/// - Parameter digipin: Canonical DIGIPIN string with no separators.
///
/// - Throws:
///     - `DigipinError.invalidDigipinLength` if the DIGIPIN length does not match the required value.
///     - `DigipinError.invalidDigipinFormat` if the DIGIPIN contains unsupported symbols.
func validateDigipinFormat(_ digipin: String) throws {
    if digipin.count != DIGIPIN_LENGTH {
        throw DigipinError.invalidDigipinLength
    }

    for character in digipin {
        if !DIGIPIN_SYMBOLS.contains(character) {
            throw DigipinError.invalidDigipinFormat
        }
    }
}
