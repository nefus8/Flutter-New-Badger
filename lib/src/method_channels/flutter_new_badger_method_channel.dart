// Copyright 2024 Simon Braillard
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_new_badger_platform_interface.dart';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'flutter_new_badger_platform_interface.dart';

/// An implementation of [FlutterNewBadgerPlatform] using a method channel.
///
/// This class communicates with the platform-specific code via a method channel.
class MethodChannelFlutterNewBadger extends FlutterNewBadgerPlatform {
  /// The [MethodChannel] used to communicate with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_new_badger');

  /// Sets the badge count on the app icon.
  ///
  /// This method sends the `setBadge` command to the native platform
  /// with the provided [count].
  ///
  /// [count] The number to display on the badge.
  /// Returns a [Future] that completes when the badge count is updated.
  @override
  Future<void> setBadge(int count) async {
    await methodChannel.invokeMethod<void>('setBadge', {"count": count});
  }

  /// Removes the badge from the app icon.
  ///
  /// This method sends the `removeBadge` command to the native platform,
  /// clearing any badge currently displayed.
  /// Returns a [Future] that completes when the badge is removed.
  @override
  Future<void> removeBadge() async {
    await methodChannel.invokeMethod<void>('removeBadge');
  }

  /// Retrieves the current badge count from the app icon.
  ///
  /// This method sends the `getBadge` command to the native platform.
  /// Returns a [Future] that completes with the current badge count,
  /// or `null` if no badge is set.
  @override
  Future<int?> getBadge() async {
    final int? badgeCount = await methodChannel.invokeMethod<int?>('getBadge');
    return badgeCount;
  }
}
