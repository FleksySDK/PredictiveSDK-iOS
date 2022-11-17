// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "FleksyCoreSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "FleksyCoreSDK",
            targets: ["FleksyCoreSDK"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/FleksySDK/FleksyEngine-iOS",
            exact: "3.5.26"
        ),
        .package(
            url: "https://github.com/FleksySDK/iOS-CoreServices",
            exact: "1.3.0"
        ),
    ],
    targets: [
        .target(
            name: "FleksyCoreSDK",
            dependencies: [
                .product(name: "FleksyEngine", package: "FleksyEngine-iOS"),
                .product(name: "iOSCoreServices", package: "iOS-CoreServices"),
                "FleksyLibModule"
            ]
        ),
        .binaryTarget(
            name: "FleksyLibModule",
            url: "https://spm.fleksy.com/FleksyLibModule/v1.1.4/FleksyLibModule-1.1.4.xcframework.zip",
            checksum: "be51a68b510203757f1b0b7c831a8f600acf30bfec79b932633d7fd72f142bcd"
        )
    ]
)
