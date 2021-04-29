import 'package:flutter/material.dart';

import '../challenge/challenge_page.dart';
import '../home/home_page.dart';
import '../result/result_page.dart';
import '../splash/splash_page.dart';

class AppRouter {
  static final initialRoute = SplashPage.routeName;

  static final routes = {
    SplashPage.routeName: (context) => SplashPage(),
    HomePage.routeName: (context) => HomePage(),
    ChallengePage.routeName: (context) => Container(),
    ResultPage.routeName: (context) => ResultPage(),
  };
}
