// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Injector",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "Injector",
                 targets: ["Injector"]),
    ],
    targets: [
        .target(name: "Injector",
                path: "Sources"),
        .testTarget(name: "InjectorTests",
                    dependencies: ["Injector"]),
    ]
)