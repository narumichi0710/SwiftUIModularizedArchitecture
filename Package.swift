// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftUIModularizedArchitecture",
    platforms: [
      .iOS(.v16),
    ],
    products: [
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "Search", targets: ["Search"]),
        .library(name: "ApiClient", targets: ["ApiClient"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "AppFeature", dependencies: [
            "ApiClient",
            "Search"
        ]),
        .target(name: "Search", dependencies: []),
        .target(name: "ApiClient", dependencies: []),
        .testTarget(name: "AppFeatureTests", dependencies: ["AppFeature"]),
    ]
)
