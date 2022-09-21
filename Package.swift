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
            exact: "1.0.0"
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
            url: "https://spm.fleksy.com/FleksyLibModule/v1.1.3/FleksyLibModule-1.1.3.xcframework.zip",
            checksum: "a9ba8c19d6307d47cf69ff340910ab24fda04f0315fe14e2d736b47e9d54af4a"
        )
    ]
)
