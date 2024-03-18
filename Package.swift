// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PredictiveSDK",
    platforms: [
        .iOS(.v13),
        .watchOS(.v8),
        .macCatalyst(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "PredictiveSDK",
            targets: ["PredictiveSDK", "FleksyCoreSDK"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/FleksySDK/FleksyEngine-iOS",
            exact: Version(3, 16, 0)
        ),
        .package(
            url: "https://github.com/FleksySDK/iOS-CoreServices",
            exact: Version(1, 14, 0)
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
            url: "https://spm.fleksy.com/FleksyLibModule/v1.6.0/FleksyLibModule.xcframework.zip",
            checksum: "d2a0e54518626f2096e8e9062aaf834dca787ad26416fc9786ef4c627ee031ff"
        ),
        .target(
            name: "FleksyCoreSDK",
            dependencies: [
                "PredictiveSDK"
            ]
        ),
    ]
)
