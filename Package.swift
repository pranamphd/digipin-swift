// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "digipin-swift",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "Digipin", targets: ["Digipin"])
    ],
    targets: [
        .target(name: "Digipin"),
        .testTarget(name: "DigipinTests", dependencies: ["Digipin"]),
    ]
)
