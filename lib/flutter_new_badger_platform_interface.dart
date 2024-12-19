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

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_new_badger_method_channel.dart';

abstract class FlutterNewBadgerPlatform extends PlatformInterface {
  /// Constructs a FlutterNewBadgerPlatform.
  FlutterNewBadgerPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNewBadgerPlatform _instance = MethodChannelFlutterNewBadger();

  /// The default instance of [FlutterNewBadgerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNewBadger].
  static FlutterNewBadgerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNewBadgerPlatform] when
  /// they register themselves.
  static set instance(FlutterNewBadgerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setBadge(int count) {
    throw UnimplementedError('setBadge() has not been implemented.');
  }

  Future<void> removeBadge() {
    throw UnimplementedError('removeBadge() has not been implemented.');
  }
}
