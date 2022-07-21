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
            url: "https://spm.fleksy.com/FleksyLibModule/v0.1.0/FleksyLibModule-0.1.0.xcframework.zip",
            checksum: "27b33bcb22887f1705462d4fac8e6ebff81b3da277063de11c93b462a383e7bc"
        )
    ]
)
