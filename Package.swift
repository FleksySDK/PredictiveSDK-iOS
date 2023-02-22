// swift-tools-version:5.7

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
            exact: "3.9.9"
        ),
        .package(
            url: "https://github.com/FleksySDK/iOS-CoreServices",
            exact: "1.5.0"
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
            url: "https://spm.fleksy.com/FleksyLibModule/v1.2.0/FleksyLibModule-1.2.0.xcframework.zip",
            checksum: "a6ebc285f083dd07fb9528fbf062043e0389a7b4b5ebab2dbfc8c1c699431cf9"
        )
    ]
)
