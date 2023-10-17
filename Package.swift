// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "PredictiveSDK",
    platforms: [
        .iOS(.v12),
        .watchOS(.v8),
        .macCatalyst(.v14)
    ],
    products: [
        .library(
            name: "PredictiveSDK",
            targets: ["PredictiveSDK", "FleksyCoreSDK"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/FleksySDK/FleksyEngine-iOS",
            exact: "3.12.32"
        ),
        .package(
            url: "https://github.com/FleksySDK/iOS-CoreServices",
            exact: "1.11.0"
        ),
    ],
    targets: [
        .target(
            name: "PredictiveSDK",
            dependencies: [
                .product(name: "FleksyEngine", package: "FleksyEngine-iOS"),
                .product(name: "iOSCoreServices", package: "iOS-CoreServices"),
                "FleksyLibModule"
            ]
        ),
        .binaryTarget(
            name: "FleksyLibModule",
            url: "https://spm.fleksy.com/FleksyLibModule/v1.5.0/FleksyLibModule.xcframework.zip",
            checksum: "67ee1931b7c94f94c590ee65947ab92c2b4abfaa756e2a7489a8a05cfce796ed"
        ),
        .target(
            name: "FleksyCoreSDK",
            dependencies: [
                "PredictiveSDK"
            ]
        ),
    ]
)
