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

/// An abstract class defining the platform interface for FlutterNewBadger.
///
/// This class acts as a contract for platform-specific implementations.
/// It uses the [PlatformInterface] class to ensure that only authorized
/// platform implementations can replace the default implementation.
abstract class FlutterNewBadgerPlatform extends PlatformInterface {
  /// Constructs a [FlutterNewBadgerPlatform].
  ///
  /// Ensures that only subclasses with the correct [token] can be used.
  FlutterNewBadgerPlatform() : super(token: _token);

  /// A unique token used to verify the integrity of the platform interface.
  static final Object _token = Object();

  /// The default instance of [FlutterNewBadgerPlatform].
  ///
  /// This defaults to an instance of [MethodChannelFlutterNewBadger],
  /// which provides the method channel implementation.
  static FlutterNewBadgerPlatform _instance = MethodChannelFlutterNewBadger();

  /// Gets the current instance of [FlutterNewBadgerPlatform].
  ///
  /// This is used to access the platform-specific implementation.
  static FlutterNewBadgerPlatform get instance => _instance;

  /// Sets a custom instance of [FlutterNewBadgerPlatform].
  ///
  /// Platform-specific implementations should set this with their own
  /// implementation when they register themselves.
  ///
  /// Throws a [PlatformInterface.verifyToken] error if the provided
  /// instance does not match the expected token.
  static set instance(FlutterNewBadgerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Sets the badge count on the app icon.
  ///
  /// This method should be implemented by platform-specific classes.
  /// Throws an [UnimplementedError] if not implemented.
  ///
  /// [count] The number to display on the badge.
  Future<void> setBadge(int count) {
    throw UnimplementedError('setBadge() has not been implemented.');
  }

  /// Removes the badge from the app icon.
  ///
  /// This method should be implemented by platform-specific classes.
  /// Throws an [UnimplementedError] if not implemented.
  Future<void> removeBadge() {
    throw UnimplementedError('removeBadge() has not been implemented.');
  }

  /// Retrieves the current badge count from the app icon.
  ///
  /// This method should be implemented by platform-specific classes.
  /// Throws an [UnimplementedError] if not implemented.
  ///
  /// Returns a [Future] that completes with the current badge count,
  /// or `null` if no badge is set.
  Future<int?> getBadge() {
    throw UnimplementedError('getBadge() has not been implemented.');
  }
}
