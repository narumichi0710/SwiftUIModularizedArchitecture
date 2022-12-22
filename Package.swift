// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftUIModularizedArchitecture",
    platforms: [
      .iOS(.v16),
    ],
    products: [
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "Tutorial", targets: ["Tutorial"]),
        .library(name: "Search", targets: ["Search"]),
        .library(name: "Explore", targets: ["Explore"]),
        .library(name: "Setting", targets: ["Setting"]),
        .library(name: "ApiClient", targets: ["ApiClient"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "AppFeature", dependencies: [
            "ApiClient",
            "Tutorial",
            "Search",
            "Explore",
            "Setting"
        ]),
        .target(name: "Tutorial", dependencies: []),
        .target(name: "Search", dependencies: []),
        .target(name: "Explore", dependencies: []),
        .target(name: "Setting", dependencies: []),
        .target(name: "ApiClient", dependencies: []),
        .testTarget(name: "AppFeatureTests", dependencies: ["AppFeature"]),
    ]
)
