// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "FleksyCoreSDK",
    platforms: [
        .iOS(.v12),
        .watchOS(.v8),
        .macCatalyst(.v15)
    ],
    products: [
        .library(
            name: "FleksyCoreSDK",
            targets: ["FleksyCoreSDK"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/FleksySDK/FleksyEngine-iOS",
            exact: "3.12.1"
        ),
        .package(
            url: "https://github.com/FleksySDK/iOS-CoreServices",
            exact: "1.6.0"
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
            url: "https://spm.fleksy.com/FleksyLibModule/v1.3.0/FleksyLibModule-1.3.0.xcframework.zip",
            checksum: "93854aa40291e8bfe99afac81dfa061d9337a9c4cc2c0dc40975f26646ba9cc5"
        )
    ]
)
