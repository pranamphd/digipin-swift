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

import Foundation

/// Errors returned by DIGIPIN operations.
///
/// ## Topics
/// ### Geodetic Validation Errors
/// - ``invalidLatitude``
/// - ``invalidLongitude``
///
/// ### Territory Errors
/// - ``outsideSupportedTerritory``
///
/// ### DIGIPIN Format Errors
/// - ``invalidDigipinLength``
/// - ``invalidDigipinFormat``
public enum DigipinError: Error, LocalizedError {

    /// Latitude is outside geodetic bounds.
    case invalidLatitude

    /// Longitude is outside geodetic bounds.
    case invalidLongitude

    /// Location is outside the DIGIPIN supported territory.
    case outsideSupportedTerritory

    /// DIGIPIN does not conform to required length.
    case invalidDigipinLength

    /// DIGIPIN contains invalid symbols or format.
    case invalidDigipinFormat

    /// Human-readable error message.
    public var errorDescription: String? {
        switch self {
        case .invalidLatitude:
            return "Latitude is outside geodetic bounds."
        case .invalidLongitude:
            return "Longitude is outside geodetic bounds."
        case .outsideSupportedTerritory:
            return "Location is outside the DIGIPIN supported territory."
        case .invalidDigipinLength:
            return "DIGIPIN does not conform to required length."
        case .invalidDigipinFormat:
            return "DIGIPIN contains invalid symbols or format."
        }
    }
}
