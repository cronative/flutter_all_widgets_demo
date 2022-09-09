import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  runApp(MaterialApp(home: LocalNotificationDemo()));
}

class LocalNotificationDemo extends StatefulWidget {
  LocalNotificationDemo({Key key}) : super(key: key);

  @override
  _LocalNotificationDemoState createState() => _LocalNotificationDemoState();
}

class _LocalNotificationDemoState extends State<LocalNotificationDemo> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    tz.initializeTimeZones();
  }

  // ignore: missing_return
  Future onSelectNotification(String payload) {
    print(payload);
  }

  showNotification() async {
    var android = AndroidNotificationDetails('id', 'channel ', 'description',
        priority: Priority.high, importance: Importance.max);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Demo App', 'Flutter Local Notification', platform,
        payload: 'Welcome to the Local Notification');
  }

  showSchedulrNotification() async {
    var android = AndroidNotificationDetails('id', 'channel ', 'description',
        priority: Priority.high, importance: Importance.max);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        'Demo App',
        'Flutter Schedule Notification',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
        platform,
        androidAllowWhileIdle: true,
        payload: 'Welcome to the Local Schedule Notification',
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Local Notification'),
              backgroundColor: Colors.red[400],
              centerTitle: true,
            ),
            body: new Center(
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
              ElevatedButton(
                  child: Text('Show Notification'),
                  onPressed: () {
                    showNotification();
                  }),
              ElevatedButton(
                  child: Text('Show Schedule Notification'),
                  onPressed: () {
                    showSchedulrNotification();
                  }),
            ])))));
  }

  // ignore: missing_return
  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {},
          )
        ],
      ),
    );
  }
}
