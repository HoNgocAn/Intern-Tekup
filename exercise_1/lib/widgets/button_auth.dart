import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  final bool isLoader;
  final VoidCallback onPressed;
  final String buttonText;

  const ButtonAuth({
    super.key,
    required this.isLoader,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoader ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 18),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: isLoader
            ? const Center(child: CircularProgressIndicator())
            : Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}