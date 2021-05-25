import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/local_notification_manager.dart';

import 'routers/app_router.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    _initialSetup();
  }

  void _initialSetup() async {
    await LocalNotificationManager.instance.localNotificationSetup();
    LocalNotificationManager.instance.requestNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter 2.2.0",
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
