
import 'package:exercise_1/screens/auth/forgot_password.dart';
import 'package:exercise_1/screens/auth/login.dart';
import 'package:exercise_1/screens/auth/sign_up.dart';
import 'package:exercise_1/screens/home/get_started.dart';
import 'package:exercise_1/screens/home/main_screen.dart';
import 'package:exercise_1/screens/onboarding/splash.dart';
import 'package:exercise_1/screens/onboarding/unifield_splash.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/mainScreen',
      routes: {
        // '/': (context) => const Splash(),
        '/unifiedSplash': (context) => const UnifiedSplashScreen(),
        '/login': (context) => const LoginView(),
        '/signUp': (context) => const SignUp(),
        '/forgotPassword': (context) => const ForgotPassword(),
        '/getStarted': (context) => const GetStarted(),
        '/mainScreen': (context) => const AppMainScreen(),
      },
    );
  }
}

