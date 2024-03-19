// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "foobar",
    targets: [
        .target(name: "foobar", dependencies: ["cfoobar"]),
        .target(name: "cfoobar"),
    ]
)
