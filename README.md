# digipin-swift

DIGIPIN (Digital Postal Index Number) is a national-level, geo-coded addressing grid developed by the **Department of Posts, Ministry of Communications, Government of India**. It provides a deterministic and reversible method to represent geographic locations in India using a **10-character alphanumeric code derived from latitude and longitude**.

This repository contains a **Swift implementation of the DIGIPIN algorithm**, intended to enable consistent and correct adoption across platforms, applications, and systems.

![DIGIPIN Logo](/digipin-social-preview.png)

## What this repository provides

- Deterministic conversion from **latitude / longitude → DIGIPIN**
- Reversible conversion from **DIGIPIN → geographic coordinates**
- Comprehensive tests to ensure correctness
- Implementation aligned with the **final DIGIPIN Technical Specification (March 2025)**

---

## Specification reference

This project implements the **DIGIPIN (Digital Postal Index Number)** algorithm strictly according to the official technical specification published by the **Department of Posts, Ministry of Communications, Government of India**.

The authoritative specification is available at:
[https://www.indiapost.gov.in/digipin](https://www.indiapost.gov.in/digipin)

All implementations in this repository aim to faithfully reproduce the behavior described in the final DIGIPIN Technical Document (March 2025).

> This repository provides an independent implementation of the DIGIPIN specification and is not an official distribution of the Department of Posts unless explicitly stated otherwise.

---

## Design principles

- **Specification-first**: Implementation strictly follows the DIGIPIN technical specification.
- **Deterministic**: The same input always produces the same output, regardless of language or platform.
- **No external dependencies**: Core logic is self-contained.

---

## Installation

Add Digipin using Swift Package Manager:

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "DigipinSwiftExample",
    dependencies: [
        .package(
            url: "https://github.com/pranamphd/digipin-swift.git",
            from: "1.0.0"
        )
    ],
    targets: [
        .executableTarget(
            name: "DigipinSwiftExample",
            dependencies: [
                .product(name: "Digipin", package: "digipin-swift")
            ]
        )
    ]
)
```
Import the module in your source code:

```swift
import Digipin
```


## Usage

```swift
do {
    let digipin = try encode(
        Location(latitude: 28.622788, longitude: 77.213033)
    )
    print("DIGIPIN:", digipin)
    let location = try decode("39J49LL8T4")
    print("Location:", location)
} catch let error as DigipinError {
    print("Error code:", error)
    print("Error description:", error.localizedDescription)
} catch {
    print("Unexpected error:", error)
}
```

The decoder accepts lowercase input and separator characters (such as `-`), and rejects invalid symbols or malformed DIGIPIN strings.

Encoding and decoding operations throw `DigipinError` on failure.

---

## Status

This repository is under active development.
The library interfaces (function and type signatures) may evolve until the first stable release (`v1.0.0`).

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpranamphd%2Fdigipin-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/pranamphd/digipin-swift)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpranamphd%2Fdigipin-swift%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/pranamphd/digipin-swift)

---

## License

This project is licensed under the **Apache License, Version 2.0**.
See the [LICENSE](LICENSE) file for details.

Swift and the Swift logo are trademarks of Apple Inc.
