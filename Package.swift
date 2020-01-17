// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
	name: "appcenter-sdk-apple",
	platforms: [
		.iOS(.v10),
	],
	products: [
		.library(
			name: "appcenter-sdk-apple",
			targets: ["appcenter-sdk-apple"]),
	],
	targets: [
		.target(
			name: "appcenter-sdk-apple",
			dependencies: []),
		.testTarget(
			name: "appcenter-sdk-apple",
			dependencies: ["appcenter-sdk-apple"]),
	]
)