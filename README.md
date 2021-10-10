# Android Alarm Clock Plugin for Flutter

This plugin allows Flutter apps to operate with the default clock application when the platform
is Android. Provides a lightweight wrapper around clock app intents. It uses Android intents to communicate with the default clock app.

## Currently supported features
* Create new Alarms
* Create new Timer
* Open default Clock app showing Alarms
* Open default Clock app showing Timers


## Usage

### Create an Alarm
Create a new alarm. Function arguments:  
`'hour'` specifies alarm hour  
`'minutes'` specifies alarm minutes  
`'title'` specifies alarm title - optional  
`'skipUi'` specifies whether clock app should open or not - optional  

```dart
// Create an alarm at 23:59
FlutterAlarmClock.createAlarm(23, 59);
```

### Create a Timer
Create a new timer. Function arguments:  
`'length'` specifies timer length in seconds  
`'title'` specifies timer title - optional  
`'skipUi'` specifies whether clock app should open or not - optional  

```dart
// Create a timer for 42 seconds
FlutterAlarmClock.createTimer(42);
```

### Show Alarms
Opens default clock app showing alarms. 

```dart
FlutterAlarmClock.showAlarms();
```

### Show Timers
Opens default clock app showing timers. 

```dart
FlutterAlarmClock.showTimers();
```

Feel free to add support for additional functionality.


> Note that a similar method does not currently exist for iOS. 

## Platform Support

| Android |
| :-----: |
|   ✔️    |

## Example App
#### Screenshot
![screenshot](https://github.com/miguelpruivo/flutter_file_picker/blob/master/example/screenshots/example.png)

#### Code

``` dart
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
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
            child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Create alarm at 23:59',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                FlutterAlarmClock.createAlarm(23, 59);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Show alarms',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                FlutterAlarmClock.showAlarms();
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Create timer for 42 seconds',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                FlutterAlarmClock.createTimer(42);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: TextButton(
              child: const Text(
                'Show Timers',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                FlutterAlarmClock.showTimers();
              },
            ),
          ),
        ])),
      ),
    );
  }
}


```

