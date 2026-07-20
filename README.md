# flutter_new_badger

## Requirements

* Flutter 3.44+ / Dart 3.12+ (since version 2.0.0)
* iOS 12.0+, macOS 10.14+, Android 5.0+ (API 21)
* On iOS and macOS, both Swift Package Manager and CocoaPods are supported

## Getting Started

### iOS

On iOS, the notification permission is required to update the badge.
It is automatically asked when the badge is added or removed.

Please also add the following to your Info.plist for remote notifications:
```xml
<key>UIBackgroundModes</key>
<array>
    <string>remote-notification</string>
</array>
```


### Android

On Android, no official API exists to show a badge in the launcher. But some devices (Samsung, HTC...) support the feature.

Add the following permission to your AndroidManifest.xml:
```xml
<!-- Samsung -->
<uses-permission android:name="com.sec.android.provider.badge.permission.READ"/>
<uses-permission android:name="com.sec.android.provider.badge.permission.WRITE"/>

<!-- Huawei -->
<uses-permission android:name="com.huawei.android.launcher.permission.CHANGE_BADGE" />
<uses-permission android:name="com.huawei.android.launcher.permission.READ_SETTINGS" />
<uses-permission android:name="com.huawei.android.launcher.permission.WRITE_SETTINGS" />

<!-- HTC -->
<uses-permission android:name="com.htc.launcher.permission.READ_SETTINGS"/>
<uses-permission android:name="com.htc.launcher.permission.UPDATE_SHORTCUT"/>

<!-- Apex -->
<uses-permission android:name="com.anddoes.launcher.permission.UPDATE_COUNT"/>

<!-- Sony -->
<uses-permission android:name="com.sonyericsson.home.permission.BROADCAST_BADGE"/>
<uses-permission android:name="com.sonymobile.home.permission.PROVIDER_INSERT_BADGE"/>

<!-- Solid -->
<uses-permission android:name="com.majeur.launcher.permission.UPDATE_BADGE"/>
```


### Dart

First, you just have to import the package in your dart files with:
```dart
import 'package:flutter_new_badger/flutter_new_badger.dart';
```

Then you can add a badge:
```dart
FlutterNewBadger.setBadge(1);
```

Remove a badge:
```dart
FlutterNewBadger.removeBadge();
```

Get the current badge:
```dart
int? badge = await FlutterNewBadger.getBadge();
```

Increment the badge count by 1 and return the new badge count:
```dart
int? int = await FlutterNewBadger.incrementBadgeCount();
```

Decrement the badge count by 1 and return the new badge count:
```dart
int? int = await FlutterNewBadger.decrementBadgeCount();
```

## Platform support

iOS and macOS have an official badge API, so badges always work there. Android has **no official API** for numeric badges: this plugin relies on [ShortcutBadger](https://github.com/leolin310148/ShortcutBadger), which calls private, launcher-specific APIs. Whether a badge shows therefore depends entirely on the device's launcher:

| Platform / launcher | Numeric badge | Why                                                                                                                                                                               |
| --- | --- |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| iOS | ✅ | Official API. Requires the notification permission (requested automatically).                                                                                                     |
| macOS | ✅ | Official API.                                                                                                                                                                     |
| Android - Samsung (One UI) | ✅ | Launcher badge provider. Requires the manifest permissions below and **Settings → Notifications → App icon badges** enabled on the device.                                        |
| Android - Huawei / Honor (EMUI) | ✅ | Launcher badge provider, with the manifest permissions below.                                                                                                                     |
| Android - HTC, Sony, Apex, Solid launchers | ⚠️ | Supported by ShortcutBadger, but these launchers are largely obsolete today.                                                                                                      |
| Android - Google Pixel / stock Android 8+ | ❌ | Stock Android has no app-settable badge count. It only shows **notification dots**, which the OS manages itself while a notification is active, `setBadge()` is silently ignored. |
| Android - Xiaomi (MIUI / HyperOS) | ❌ | Badges are tied to actual posted notifications; an arbitrary count cannot be set by an app.                                                                                       |

On unsupported launchers the plugin is a silent no-op, it won't crash, the badge just doesn't appear.