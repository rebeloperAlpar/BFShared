// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BFShared",
    platforms: [
        .iOS(.v16), .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BFShared",
            targets: ["BFShared"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/rebeloperAlpar/FirebaseService300.git", from: "3.0.0"),
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "9.3.0")),
        .package(name: "Stripe", url: "https://github.com/stripe/stripe-ios.git", .upToNextMajor(from: "22.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BFShared",
            dependencies: [
                "FirebaseService300",
                .product(name: "FirebaseFunctions", package: "Firebase"),
                .product(name: "FirebaseDynamicLinks", package: "Firebase"),
                .product(name: "FirebaseMessaging", package: "Firebase"),
                .product(name: "Stripe", package: "Stripe")
            ]),
        .testTarget(
            name: "BFSharedTests",
            dependencies: ["BFShared"]),
    ]
)
