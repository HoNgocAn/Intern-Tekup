
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVDpeBW0W6qVli5Y_UxAwZ7FBgMbSlwi7fMw&s",
          height: 150,
          width: 300,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              "assets/img_err.png",
              height: 150,
              width: 300,
            );
          },
        ),
      ),
    );
  }
}
