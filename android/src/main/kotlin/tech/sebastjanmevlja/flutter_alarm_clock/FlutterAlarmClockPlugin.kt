package tech.sebastjanmevlja.flutter_alarm_clock

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Build
import android.provider.AlarmClock
import android.provider.AlarmClock.ACTION_SHOW_ALARMS
import android.provider.AlarmClock.ACTION_SHOW_TIMERS
import android.util.Log
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler


/** FlutterAlarmClockPlugin */
class FlutterAlarmClockPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    ///
    /// Docs: https://developer.android.com/reference/android/provider/AlarmClock
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    /// Save context and activity for sending intents
    private lateinit var context: Context
    private lateinit var activity: Activity

    private val TAG = "FlutterAlarmClockPlugin"


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_alarm_clock")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when {
            call.method.equals("showAlarms") -> {
                showAlarms()
            }
            call.method.equals("createAlarm") -> {
                val hour = call.argument<Int>("hour")
                val minutes = call.argument<Int>("minutes")
                val title = call.argument<String>("title")
                val skipUi = call.argument<Boolean>("skipUi")
                if (hour != null && minutes != null) {
                    createAlarm(hour, minutes, title, skipUi)
                } else {
                    Log.e(TAG, "Hour and minutes must be provided")
                }
            }
            call.method.equals("showTimers") -> {
                showTimers()
            }
            call.method.equals("createTimer") -> {
                val length = call.argument<Int>("length")
                val title = call.argument<String>("title")
                val skipUi = call.argument<Boolean>("skipUi")
                if (length != null) {
                    createTimer(length, title, skipUi)
                } else {
                    Log.e(TAG, "Length must be provided")
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }


    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    }

    override fun onDetachedFromActivity() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    /**
     * Crate an alarm using the default clock app
     * @param hour Int AlarmClock.EXTRA_HOUR
     * @param minutes Int AlarmClock.EXTRA_MINUTES
     * @param title String? AlarmClock.EXTRA_MESSAGE (alarm title)
     * @param skipUi Boolean? AlarmClock.EXTRA_SKIP_UI (don't open the clock app)
     */
    private fun createAlarm(hour: Int, minutes: Int, title: String? = "", skipUi: Boolean? = true) {
        val i = Intent(AlarmClock.ACTION_SET_ALARM)
        i.putExtra(AlarmClock.EXTRA_HOUR, hour)
        i.putExtra(AlarmClock.EXTRA_MINUTES, minutes)
        i.putExtra(AlarmClock.EXTRA_MESSAGE, title)
        i.putExtra(AlarmClock.EXTRA_SKIP_UI, skipUi)
        activity.startActivity(i)
    }

    /**
     * Crate a timer using the default clock app
     * @param length Int AlarmClock.EXTRA_LENGTH
     * @param title String? AlarmClock.EXTRA_MESSAGE (timer title)
     * @param skipUi Boolean? AlarmClock.EXTRA_SKIP_UI (don't open the clock app)
     */
    @RequiresApi(Build.VERSION_CODES.KITKAT)
    private fun createTimer(length: Int, title: String? = "", skipUi: Boolean? = true) {
        val i = Intent(AlarmClock.ACTION_SET_TIMER)
        i.putExtra(AlarmClock.EXTRA_LENGTH, length)
        i.putExtra(AlarmClock.EXTRA_MESSAGE, title)
        i.putExtra(AlarmClock.EXTRA_SKIP_UI, skipUi)
        activity.startActivity(i)
    }

    /**
     * Show alarms in the default clock app
     */
    @RequiresApi(Build.VERSION_CODES.KITKAT)
    private fun showAlarms() {
        val i = Intent(ACTION_SHOW_ALARMS)
        activity.startActivity(i)
    }

    /**
     * Show timers in the default clock app
     */
    private fun showTimers() {
        val i = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Intent(ACTION_SHOW_TIMERS)
        } else {
            TODO("VERSION.SDK_INT < O")
        }
        activity.startActivity(i)
    }
}
