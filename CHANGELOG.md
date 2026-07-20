## 2.0.0

* feat: Add Swift Package Manager support for iOS and macOS (thanks @qMalte), CocoaPods keeps working
* feat: Migrate the Android build to built-in Kotlin (AGP 9+ ready), the plugin no longer applies the Kotlin Gradle Plugin
* **BREAKING**: Updates the minimum supported SDK version to Flutter 3.44 / Dart 3.12
* fix: Declare the FlutterFramework dependency in the iOS and macOS Package.swift, as required by the Flutter 3.44 Swift Package Manager integration
* chore: Modernize the example app: Android regenerated for AGP 9.0.1 / Gradle 9.1 / built-in Kotlin, iOS and macOS regenerated without CocoaPods and use Swift Package Manager by default
* docs: Document the new minimum requirements and add a platform support table in the README (explains why badges don't show on stock Android/Pixel and Xiaomi, see #1)

## 1.1.1
* Open sourcing library

## 1.1.0

* feat: Adding a function to get the badge number
* feat: Adding function to increment the badge number
* feat: Adding function to decrement the badge number
* fix: Updating dependencies
* fix: Updating example app
* fix: Updating native code to respect latest versions of Android, iOS and macOS

## 1.0.1

* Bug fix with android

## 1.0.0

* Example app

## 0.0.1

* New version
