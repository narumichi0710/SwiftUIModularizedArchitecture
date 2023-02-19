// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftUIModularizedArchitecture",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "Tutorial", targets: ["Tutorial"]),
        .library(name: "Chat", targets: ["Chat"]),
        .library(name: "Search", targets: ["Search"]),
        .library(name: "Setting", targets: ["Setting"]),
        .library(name: "ApiClient", targets: ["ApiClient"]),
        .library(name: "SearchClient", targets: ["SearchClient"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "AppFeature", dependencies: [
            "Tutorial",
            "Chat",
            "Search",
            "Setting"
        ]),
        .target(name: "Tutorial", dependencies: []),
        .target(name: "Chat", dependencies: []),
        .target(name: "Search", dependencies: ["SearchClient"]),
        .target(name: "Setting", dependencies: []),
        .target(name: "ApiClient", dependencies: []),
        .target(name: "SearchClient", dependencies: ["ApiClient"]),
        .testTarget(name: "AppFeatureTests", dependencies: ["AppFeature"]),
    ]
)
