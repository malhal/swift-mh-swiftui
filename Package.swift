// swift-tools-version: 5.9
// swift-mh-swiftui/Package.swift
import Foundation
import PackageDescription

// 1. Get the absolute path of this package
let packageRoot = Context.packageDirectory

// 2. Define our two potential local paths
let umbrellaPath = URL(fileURLWithPath: packageRoot).deletingLastPathComponent().appendingPathComponent("swift-mh-foundation").path
let nestedPath = URL(fileURLWithPath: packageRoot).appendingPathComponent("swift-mh-foundation").path

// 3. Determine which dependency to use
let fileManager = FileManager.default
let isUmbrella = fileManager.fileExists(atPath: "\(umbrellaPath)/Package.swift")
let isNested = fileManager.fileExists(atPath: "\(nestedPath)/Package.swift")

let package = Package(
    name: "swift-mh-swiftui",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "MHSwiftUI", targets: ["MHSwiftUI"]),
    ],
    dependencies: {
        if isUmbrella {
            // Priority 1: Sibling folder (Umbrella mode)
            return [.package(path: "../swift-mh-foundation")]
        } else if isNested {
            // Priority 2: Subfolder (Standalone mode with submodule)
            return [.package(path: "./swift-mh-foundation")]
        } else {
            // Priority 3: GitHub (Remote/Consumer mode)
            return [.package(url: "https://github.com/malhal/swift-mh-foundation.git", branch: "main")]
        }
    }(),
    targets: [
        .target(
            name: "MHSwiftUI",
            dependencies: [
                .product(name: "MHFoundation", package: "swift-mh-foundation")
            ]
        )
    ]
)
