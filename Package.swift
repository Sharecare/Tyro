// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tyro",
    products: [
        .library(
            name: "Tyro",
            targets: ["Tyro"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Sharecare/Swiftz.git", .branch("feature/xcode12-exp")),
        .package(url: "https://github.com/typelift/SwiftCheck.git", from: "0.8.1")
    ],
    targets: [
        .target(
            name: "Tyro",
            dependencies: ["Swiftz"]),
        .testTarget(
            name: "TyroTests",
            dependencies: ["Tyro", "Swiftz", "SwiftCheck"],
            resources: [.copy("json-data")])

    ]
)
