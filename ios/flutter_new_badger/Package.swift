// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "flutter_new_badger",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "flutter-new-badger", targets: ["flutter_new_badger"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "flutter_new_badger",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            path: "Sources/flutter_new_badger",
            resources: [
                .process("Resources/PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
