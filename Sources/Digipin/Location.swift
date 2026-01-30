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

/// Represents a geographic location with latitude and longitude.
///
/// Both values are expressed in decimal degrees using the WGS-84
/// coordinate reference system.
public struct Location: Equatable, Sendable {

    /// Latitude in decimal degrees.
    public let latitude: Double

    /// Longitude in decimal degrees.
    public let longitude: Double

    /// Creates a new geographic location.
    ///
    /// - Parameters:
    ///   - latitude: Latitude in decimal degrees.
    ///   - longitude: Longitude in decimal degrees.
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
