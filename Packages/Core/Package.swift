// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "CoreUI",
            targets: ["CoreUI"]
        ),
        .library(
            name: "Persistence",
            targets: ["Persistence"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-dependencies",
            from: "1.0.0"
        )
    ],
    targets: [
        .target(
            name: "CoreUI",
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "Persistence",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        )
    ]
)
