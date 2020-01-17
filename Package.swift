// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let packageName = "appcenter-sdk-apple"

let package = Package(
	name: packageName,
	platforms: [ .iOS(.v10) ],
	products: [ .library(name: packageName, targets: [packageName]) ],
	targets: [ .target(name: packageName, dependencies: [])]
)