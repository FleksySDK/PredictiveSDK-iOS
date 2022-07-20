// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "FleksyCoreSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FleksyCoreSDK",
            targets: ["FleksyCoreSDK"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/FleksySDK/FleksyEngine-iOS",
            exact: "3.5.18"
        ),
        .package(
            url: "https://github.com/FleksySDK/iOS-CoreServices",
            exact: "0.1.18"
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
            url: "https://spm.fleksy.com/FleksyLibModule/v0.0.2/FleksyLibModule-0.0.2.xcframework.zip",
            checksum: "32c2103cf4a26853c18baab58d41ab0a18c7a03bd44c0b9faeb563bbc91a3a7e"
        )
    ]
)
