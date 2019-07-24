// swift-tools-version:4.2

import PackageDescription

let package = Package(
        name: "SwiftBoxLogging",

        products: [
            .library(name: "SwiftBoxLogging", type: .static, targets: ["SwiftBoxLogging"]),
        ],
        dependencies: [
            .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        ],

        targets: [
            .target(
                    name: "SwiftBoxLogging",
                    dependencies: ["Vapor"]
            ),
            .testTarget(
                    name: "SwiftBoxLoggingTests",
                    dependencies: ["SwiftBoxLogging"]
            ),
        ]
)
