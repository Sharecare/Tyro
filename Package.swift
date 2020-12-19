// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Tyro",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Tyro",
            targets: ["Tyro-iOS"])
    ],
    dependencies: [
        .package(url: "https://github.com/typelift/Swiftz.git", from: "0.0.0"),
        .package(url: "https://github.com/typelift/SwiftCheck.git", from: "0.8.1")
    ],
    targets: [
        .target(
            name: "Tyro",
            path: "Tyro"
        )
    ]
)
