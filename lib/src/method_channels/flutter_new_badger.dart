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

import 'flutter_new_badger_platform_interface.dart';

class FlutterNewBadger {

  /// Sets the badge count on the app icon.
  static Future<void> setBadge(int count) {
    return FlutterNewBadgerPlatform.instance.setBadge(count);
  }

  /// Removes the badge from the app icon.
  static Future<void> removeBadge() {
    return FlutterNewBadgerPlatform.instance.removeBadge();
  }

  /// Retrieves the current badge count.
  static Future<int?> getBadge() {
    return FlutterNewBadgerPlatform.instance.getBadge();
  }

  /// Increments the badge count by 1.
  static Future<int?> incrementBadgeCount() async {
    final int? currentBadgeCount = await getBadge();
    if (currentBadgeCount != null) {
      await setBadge(currentBadgeCount + 1);
      return currentBadgeCount + 1;
    } else {
      await setBadge(1);
      return 1;
    }
  }

  /// Decrements the badge count by 1.
  static Future<int?> decrementBadgeCount() async {
    final int? currentBadgeCount = await getBadge();
    if (currentBadgeCount != null && currentBadgeCount > 0) {
      await setBadge(currentBadgeCount - 1);
      return currentBadgeCount - 1;
    }
    return null;
  }
}
