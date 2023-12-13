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
            exact: "1.13.0"
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
            url: "https://spm.fleksy.com/FleksyLibModule/v1.5.1/FleksyLibModule.xcframework.zip",
            checksum: "c6660aebaf48b095f5121e666a06e82e1e28555a53ae7202d9793e37b31f7abb"
        ),
        .target(
            name: "FleksyCoreSDK",
            dependencies: [
                "PredictiveSDK"
            ]
        ),
    ]
)
