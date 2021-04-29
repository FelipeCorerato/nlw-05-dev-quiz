import 'package:flutter/material.dart';

import '../core/app_images.dart';
import '../core/app_gradients.dart';
import '../home/home_page.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then(
      (_) => Navigator.pushReplacementNamed(context, HomePage.routeName),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
