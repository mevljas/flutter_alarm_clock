import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

void main() {
  runApp(const MyApp());
}

/// {@template myApp}
/// A main class for the Flutter alarm clock example application.
/// {@endtemplate}
class MyApp extends StatefulWidget {
  /// @{@macro myApp}
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter alarm clock example'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(25),
                child: TextButton(
                  child: const Text(
                    'Create alarm at 23:59',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    FlutterAlarmClock.createAlarm(hour: 23, minutes: 59);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: const TextButton(
                  onPressed: FlutterAlarmClock.showAlarms,
                  child: Text(
                    'Show alarms',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: TextButton(
                  child: const Text(
                    'Create timer for 42 seconds',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    FlutterAlarmClock.createTimer(length: 42);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: const TextButton(
                  onPressed: FlutterAlarmClock.showTimers,
                  child: Text(
                    'Show Timers',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
