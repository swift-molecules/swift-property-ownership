// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-property-ownership",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Property Ownership",
            targets: ["Property Ownership"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-property.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ownership.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-tagged.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Property Ownership",
            dependencies: [
                .product(name: "Property", package: "swift-property"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Ownership Borrow", package: "swift-ownership"),
                .product(name: "Ownership Inout", package: "swift-ownership"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .testTarget(
            name: "Property Ownership Tests",
            dependencies: [
                .product(name: "Ownership Borrow", package: "swift-ownership"),
                .product(name: "Ownership Inout", package: "swift-ownership"),
                "Property Ownership",
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Property", package: "swift-property"),
            ],
            path: "Tests/Property Ownership Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
