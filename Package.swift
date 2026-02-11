// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "swift-mh-swiftui",
    products: [
        .library(name: "MHSwiftUI", targets: ["MHSwiftUI"]),
    ],
    targets: [
        .target(
            name: "MHSwiftUI",
            dependencies: []
        )
    ]
)
