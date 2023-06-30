import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// A [FlutterAlarmClock] class for interacting with Android alarm clock
/// using Android intents.
class FlutterAlarmClock {
  static const MethodChannel _channel = MethodChannel('flutter_alarm_clock');

  /// Shows the alarms.
  ///
  /// Opens the default clock app showing alarms.
  static void showAlarms() {
    try {
      if (Platform.isAndroid) {
        _channel.invokeMethod('showAlarms');
      } else {
        throw UnimplementedError();
      }
    } on PlatformException {
      debugPrint('Error showing alarms.');
    }
  }

  /// Shows the timers.
  ///
  /// Opens the default clock app showing timers.
  static void showTimers() {
    try {
      if (Platform.isAndroid) {
        _channel.invokeMethod('showTimers');
      } else {
        throw UnimplementedError();
      }
    } on PlatformException {
      debugPrint('Error showing timers.');
    }
  }

  /// Creates an alarm at the specified [hour] and [minutes].
  ///
  /// Optionally alarm's [title] can also be specified and
  /// whether clock app should open or not
  /// using the [skipUi] flag.
  static void createAlarm({
    required int hour,
    required int minutes,
    String title = '',
    bool skipUi = true,
  }) {
    try {
      if (Platform.isAndroid) {
        _channel.invokeMethod('createAlarm', <String, dynamic>{
          'hour': hour,
          'minutes': minutes,
          'title': title,
          'skipUi': skipUi,
        });
      } else {
        throw UnimplementedError();
      }
    } on PlatformException {
      debugPrint('Error creating an alarm.');
    }
  }

  /// Creates a timer with a specified [length] in seconds.
  ///
  /// Optionally timer's [title] can also be specified and
  /// whether clock app should open or not
  /// using the [skipUi] flag.
  static void createTimer({
    required int length,
    String title = '',
    bool skipUi = true,
  }) {
    try {
      if (Platform.isAndroid) {
        _channel.invokeMethod('createTimer', <String, dynamic>{
          'length': length,
          'title': title,
          'skipUi': skipUi,
        });
      } else {
        throw UnimplementedError();
      }
    } on PlatformException {
      debugPrint('Error creating a timer.');
    }
  }
}
