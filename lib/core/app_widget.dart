import 'package:flutter/material.dart';

import './app_router.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
