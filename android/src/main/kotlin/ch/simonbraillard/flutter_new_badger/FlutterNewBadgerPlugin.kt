package ch.simonbraillard.flutter_new_badger

import android.content.Context
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import me.leolin.shortcutbadger.ShortcutBadger

/** FlutterNewBadgerPlugin */
class FlutterNewBadgerPlugin : FlutterPlugin, MethodCallHandler {

  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  // Key for SharedPreferences
  private val PREFS_NAME = "flutter_new_badger_prefs"
  private val KEY_BADGE_COUNT = "badge_count"

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_new_badger")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "setBadge" -> {
        val count = call.argument<Int>("count")
        if (count != null && count >= 0) {
          applyBadgeCount(count, result)
        } else {
          result.error("BAD_ARGS", "Invalid badge count. 'count' must be a non-negative integer.", null)
        }
      }
      "removeBadge" -> {
        removeBadgeCount(result)
      }
      "getBadge" -> {
        getBadgeCount(result)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun applyBadgeCount(count: Int, result: Result) {
    try {
      // Apply the badge count
      ShortcutBadger.applyCount(context, count)
      // Persist the badge count
      saveBadgeCount(count)
      result.success(null)
    } catch (e: Exception) {
      result.error("BADGE_ERROR", "Failed to set badge: ${e.localizedMessage}", null)
    }
  }

  private fun removeBadgeCount(result: Result) {
    try {
      // Remove the badge count
      ShortcutBadger.removeCount(context)
      // Persist the badge count as 0
      saveBadgeCount(0)
      result.success(null)
    } catch (e: Exception) {
      result.error("BADGE_ERROR", "Failed to remove badge: ${e.localizedMessage}", null)
    }
  }

  private fun getBadgeCount(result: Result) {
    try {
      val badgeCount = loadBadgeCount()
      result.success(badgeCount)
    } catch (e: Exception) {
      result.error("BADGE_ERROR", "Failed to get badge count: ${e.localizedMessage}", null)
    }
  }

  private fun saveBadgeCount(count: Int) {
    val sharedPreferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    with(sharedPreferences.edit()) {
      putInt(KEY_BADGE_COUNT, count)
      apply()
    }
  }

  private fun loadBadgeCount(): Int {
    val sharedPreferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    return sharedPreferences.getInt(KEY_BADGE_COUNT, 0)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
