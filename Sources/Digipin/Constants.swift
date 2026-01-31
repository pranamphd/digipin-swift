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

// MARK: - Geodetic coordinate limits (WGS-84 compatible)

/// Minimum latitude for geodetic coordinates
let GEODETIC_LATITUDE_MIN: Double = -90.0

/// Maximum latitude for geodetic coordinates
let GEODETIC_LATITUDE_MAX: Double = 90.0

/// Minimum longitude for geodetic coordinates
let GEODETIC_LONGITUDE_MIN: Double = -180.0

/// Maximum longitude for geodetic coordinates
let GEODETIC_LONGITUDE_MAX: Double = 180.0

// MARK: - Official DIGIPIN supported territory bounds

/// Minimum latitude for DIGIPIN supported territory
let DIGIPIN_LATITUDE_MIN: Double = 2.5

/// Maximum latitude for DIGIPIN supported territory
let DIGIPIN_LATITUDE_MAX: Double = 38.5

/// Minimum longitude for DIGIPIN supported territory
let DIGIPIN_LONGITUDE_MIN: Double = 63.5

/// Maximum longitude for DIGIPIN supported territory
let DIGIPIN_LONGITUDE_MAX: Double = 99.5

// MARK: - DIGIPIN symbol definitions

/// Official DIGIPIN symbol set (base-16).
///
/// Order is significant and MUST NOT be changed.
let DIGIPIN_SYMBOLS: [Character] = [
    "F", "C", "9", "8",
    "J", "3", "2", "7",
    "K", "4", "5", "6",
    "L", "M", "P", "T",
]

/// Length of a DIGIPIN code in characters
let DIGIPIN_LENGTH: Int = 10

/// Size of the DIGIPIN grid along one axis (4 × 4)
let DIGIPIN_GRID_SIZE: Int = 4

// MARK: - DIGIPIN label grid

/// 2D array representing the DIGIPIN label grid.
///
/// - Row index corresponds to latitude subdivision (south → north)
/// - Column index corresponds to longitude subdivision (west → east)
///
/// Structure exactly matches the official specification.
let DIGIPIN_LABEL_GRID: [[Character]] = [
    ["F", "C", "9", "8"],
    ["J", "3", "2", "7"],
    ["K", "4", "5", "6"],
    ["L", "M", "P", "T"],
]

// MARK: - Reverse lookup table (symbol → grid indices)

/// Lookup table mapping DIGIPIN symbols to `(row, column)` indices.
///
/// Used during DIGIPIN decoding for O(1) symbol resolution.
let DIGIPIN_SYMBOL_TO_INDEX: [Character: (row: Int, column: Int)] = {
    var map: [Character: (row: Int, column: Int)] = [:]

    for (rowIndex, row) in DIGIPIN_LABEL_GRID.enumerated() {
        for (columnIndex, symbol) in row.enumerated() {
            map[symbol] = (row: rowIndex, column: columnIndex)
        }
    }

    return map
}()

// MARK: - Testing / conformance constants

/// Maximum possible positional error after DIGIPIN decoding, in degrees.
///
/// Derived from specification:
///   36° / 4¹⁰ / 2
let DIGIPIN_MAX_DECODE_ERROR_DEGREES: Double =
    0.000_017_166_137_695_312_5
