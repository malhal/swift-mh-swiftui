// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "swift-mh-swiftui",
    products: [
        .library(name: "MHSwiftUI", targets: ["MHSwiftUI"]),
    ],
    dependencies: [
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
