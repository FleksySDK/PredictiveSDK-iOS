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
            exact: "3.12.2"
        ),
        .package(
            url: "https://github.com/FleksySDK/iOS-CoreServices",
            exact: "1.6.1"
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
            url: "https://spm.fleksy.com/FleksyLibModule/v1.4.0/FleksyLibModule.xcframework.zip",
            checksum: "d6688f70d09ccc549e3eedf59f5896cd52bee1d1ff85d679a1980263ebfbc422"
        ),
        .target(
            name: "FleksyCoreSDK",
            dependencies: [
                "PredictiveSDK"
            ]
        ),
    ]
)
