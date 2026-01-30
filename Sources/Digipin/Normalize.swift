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
//

/// Normalize a DIGIPIN string.
///
/// Normalization prepares a DIGIPIN for validation and decoding by
/// enforcing a canonical textual representation.
///
/// - Parameter `digipin`: DIGIPIN string that may contain separators
///   and mixed character casing.
/// - Returns: A normalized DIGIPIN string with separators removed
///   and all characters converted to uppercase.
internal func normalize(_ digipin: String) -> String {
    var result = String()
    result.reserveCapacity(digipin.count)

    for character in digipin {
        if character != "-" {
            result.append(Character(character.uppercased()))
        }
    }

    return result
}
