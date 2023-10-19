// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftInjector",
    products: [
        .library(name: "SwiftInjector",
                 targets: ["SwiftInjector"]),
    ],
    targets: [
        .target(name: "SwiftInjector",
                path: "Sources"),
        .testTarget(name: "SwiftInjectorTests",
                    dependencies: ["SwiftInjector"]),
    ]
)
