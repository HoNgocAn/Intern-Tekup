import 'package:exercise_1/screens/onboarding/unifield_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UnifiedSplashScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVDpeBW0W6qVli5Y_UxAwZ7FBgMbSlwi7fMw&s",
          height: 150,
          width: 300,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/images/img_err.png', height: 150, width: 300);
          },
        ),
      ),
    );
  }
}