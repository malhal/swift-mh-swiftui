// swift-tools-version: 5.9
import Foundation
import PackageDescription

let isLocal = FileManager.default.fileExists(atPath: "../swift-mh-foundation")

let package = Package(
    name: "swift-mh-swiftui",
    products: [
        .library(name: "MHSwiftUI", targets: ["MHSwiftUI"]),
    ],
    dependencies: isLocal ? [
        // 1. If local folder exists, use it (No identity conflict)
        .package(path: "../swift-mh-foundation")
    ] : [
        // 2. Otherwise, use the remote URL (Standalone mode)
        .package(url: "https://github.com/malhal/swift-mh-foundation.git", branch: "main")
    ],
    targets: [
        .target(
            name: "MHSwiftUI",
            dependencies: [
                .product(name: "MHFoundation", package: "swift-mh-foundation")
            ]
        )
    ]
)
