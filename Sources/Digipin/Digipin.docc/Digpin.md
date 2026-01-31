# ``Digipin``

A Swift implementation of India’s Digital Postal Index Number (DIGIPIN).

## Overview

Digipin is a lightweight, offline-first Swift library for generating and decoding **DIGIPIN** codes from geographic coordinates.

DIGIPIN is a national geo-coded addressing system defined by the Department of Posts, Government of India. It divides the country into uniform grid cells of approximately **4m × 4m**, assigning each cell a deterministic 10-character alphanumeric code derived purely from latitude and longitude.

![DIGIPIN Logo](digipin-social-preview)

This package focuses on deterministic and repeatable results, operates entirely offline without any network or external dependencies, preserves user privacy by relying solely on coordinate-based computation, and fully complies with the official DIGIPIN specification published in March 2025.

## Use Cases

Digipin is suitable for logistics and last-mile delivery systems, address normalization and deduplication workflows, emergency response platforms, fintech KYC and verification flows, and any application that requires precise, offline location identification within India.

## Usage

```swift
import Digipin

let digipin = try encode(
    latitude: 28.622788,
    longitude: 77.213033
)

let location = try decode("39J49LL8T4")
```

## Platform Support

Digipin is implemented entirely in Swift, has no platform-specific or system-level dependencies, and can be used on any platform supported by Swift.
