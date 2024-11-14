// swift-tools-version: 5.9.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SetKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SetKit",
            targets: ["SetKit"]),
    ],
    targets: [
        .binaryTarget(name: "SetKit", path: "./Artifacts/SetKit.xcframework")
    ]
)