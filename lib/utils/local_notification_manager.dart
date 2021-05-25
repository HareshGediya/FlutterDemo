import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationManager {
  static LocalNotificationManager? _localNotificationManager;

  LocalNotificationManager._internal();

  static LocalNotificationManager get instance {
    if (_localNotificationManager == null) {
      _localNotificationManager = LocalNotificationManager._internal();
    }
    return _localNotificationManager!;
  }

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late SelectNotificationCallback onSelectNotification;

  void requestNotificationPermission() {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> localNotificationSetup() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await _flutterLocalNotificationsPlugin
            .getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      print(notificationAppLaunchDetails!.payload);
    }

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('app_icon');

    const IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: iosInitializationSettings,
      android: androidInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<void> showNotification() async {
    await _flutterLocalNotificationsPlugin
        .show(0, 'Title', 'Notification body', null, payload: "/productDetail");
  }
}

typedef SelectNotificationCallback = Future<dynamic> Function(String? payload);
