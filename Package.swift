// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "SSTracker",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SSTracker",
            targets: ["SSTracker"]
        ),
    ],
    targets: [
        .target(
            name: "SSTracker"
        ),
    ]
)
