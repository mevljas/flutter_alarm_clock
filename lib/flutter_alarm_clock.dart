import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FlutterAlarmClock {
  static const MethodChannel _channel = MethodChannel('flutter_alarm_clock');

  /// Show Alarms
  ///
  /// Opens default clock app showing alarms.
  static void showAlarms() {
    try {
      if (Platform.isAndroid) {
        _channel.invokeMethod('showAlarms');
      } else {
        throw UnimplementedError;
      }
    } on PlatformException {
      debugPrint("Error showing alarms.");
    }
  }

  /// Show Timers
  ///
  /// Opens default clock app showing timers.
  static void showTimers() {
    try {
      if (Platform.isAndroid) {
        _channel.invokeMethod('showTimers');
      } else {
        throw UnimplementedError;
      }
    } on PlatformException {
      debugPrint("Error showing timers.");
    }
  }

  /// Create an alarm.
  ///
  /// 'hour' specifies alarm hour
  /// 'minutes' specifies alarm minutes
  /// 'title' specifies alarm title - optional
  /// 'skipUi' specifies whether clock app should open or not - optional
  static void createAlarm(int hour, int minutes,
      {String title = "", bool skipUi = true}) {
    try {
      if (Platform.isAndroid) {
        _channel.invokeMethod('createAlarm', <String, dynamic>{
          'hour': hour,
          'minutes': minutes,
          'title': title,
          'skipUi': skipUi,
        });
      } else {
        throw UnimplementedError;
      }
    } on PlatformException {
      debugPrint("Error creating an alarm.");
    }
  }

  ///Create a Timer
  ///
  /// Create a new timer. Function arguments:
  /// 'length' specifies timer length in seconds
  /// 'title' specifies timer title - optional
  /// 'skipUi' specifies whether clock app should open or not - optional
  static void createTimer(int length, {String title = "", bool skipUi = true}) {
    try {
      if (Platform.isAndroid) {
        _channel.invokeMethod('createTimer', <String, dynamic>{
          'length': length,
          'title': title,
          'skipUi': skipUi,
        });
      } else {
        throw UnimplementedError;
      }
    } on PlatformException {
      debugPrint("Error creating a timer.");
    }
  }
}
