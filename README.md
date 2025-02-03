# flutter_new_badger

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