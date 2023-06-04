// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PSNetworkVaporExampleServer",
    platforms: [.macOS(.v10_15)],
    dependencies: [
         .package(url: "https://github.com/tiagopoleze/PSNetwork", branch: "main"),
         .package(url: "https://github.com/tiagopoleze/PSNetworkVapor", branch: "main"),
         .package(url: "https://github.com/tiagopoleze/PSNetworkVaporSharedLibrary", branch: "main"),
         .package(url: "https://github.com/vapor/vapor", from: "4.0.0")
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                "PSNetwork",
                "PSNetworkVapor",
                .product(name: "Vapor", package: "vapor"),
                 "PSNetworkVaporSharedLibrary"
            ]
        )
    ]
)
