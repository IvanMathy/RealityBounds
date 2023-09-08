// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "RealityBounds",
    platforms: [.iOS(.v15), .macOS(.v13), .visionOS(.v1)],
    products: [
        .library(
            name: "RealityBounds",
            targets: ["RealityBounds"]),
    ],
    targets: [
        .target(
            name: "RealityBounds")
    ]
)
