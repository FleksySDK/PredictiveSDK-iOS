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
            exact: Version(3, 18, 1)
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
            url: "https://spm.fleksy.com/FleksyLibModule/v1.7.0/FleksyLibModule.xcframework.zip",
            checksum: "d84d5f333a0bc0c9fae75b8068f76e2c941fe50cb0abd4aa6d7972906449324b"
        ),
        .target(
            name: "FleksyCoreSDK",
            dependencies: [
                "PredictiveSDK"
            ]
        ),
    ]
)
