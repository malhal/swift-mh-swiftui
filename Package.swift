// swift-tools-version: 5.9
import Foundation
import PackageDescription

// 1. Get the directory containing THIS Package.swift
let currentDir = Context.packageDirectory

// 2. Build the path to the expected neighbor (Foundation)
// We go up one level from the SwiftUI folder to the Umbrella root
let rootDir = URL(fileURLWithPath: currentDir).deletingLastPathComponent()
let foundationPath = rootDir.appendingPathComponent("swift-mh-foundation")

// 3. Check if the neighbor's Package.swift actually exists
let isLocal = FileManager.default.fileExists(atPath: foundationPath.appendingPathComponent("Package.swift").path)

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
