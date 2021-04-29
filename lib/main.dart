import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(AppWidget());
}
