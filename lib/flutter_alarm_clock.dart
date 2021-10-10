import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FlutterAlarmClock {
  static const MethodChannel _channel = MethodChannel('flutter_alarm_clock');

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
