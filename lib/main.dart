import 'package:flutter/material.dart';

import 'routers/app_router.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter 2.2.0",
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
