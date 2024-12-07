// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "User",
    platforms: [ .iOS(.v18) ],
    products: [
        .library(
            name: "User",
            targets: ["User"]
        )
    ],
    dependencies: [
        .package(path: "../Core")
    ],
    targets: [
        .target(
            name: "User",
            dependencies: [
                .product(name: "Persistence", package: "Core")
            ]
        )
    ]
)
