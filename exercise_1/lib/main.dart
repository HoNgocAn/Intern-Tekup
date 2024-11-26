import 'package:exercise_1/screens/forgot_password.dart';
import 'package:exercise_1/screens/login.dart';
import 'package:exercise_1/screens/sign_up.dart';
import 'package:exercise_1/screens/splash.dart';
import 'package:exercise_1/screens/splash_1.dart';
import 'package:exercise_1/screens/splash_2.dart';
import 'package:exercise_1/screens/splash_3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ForgotPassword()
    );
  }
}


