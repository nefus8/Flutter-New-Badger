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

/// An implementation of [FlutterNewBadgerPlatform] that uses method channels.
class MethodChannelFlutterNewBadger extends FlutterNewBadgerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_new_badger');

  /// Set badge count
  @override
  Future<void> setBadge(int count) async {
    await methodChannel.invokeMethod<void>('setBadge', {"count": count});
  }

  /// Remove badge
  @override
  Future<void> removeBadge() async {
    await methodChannel.invokeMethod<void>('removeBadge');
  }
}
