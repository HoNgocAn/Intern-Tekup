import 'package:flutter/material.dart';
class LogoInAuth extends StatelessWidget {
  final String text;
  final String targetPage;  // targetPage sẽ là String đại diện cho route
  final String buttonText;

  const LogoInAuth({
    super.key,
    required this.text,
    required this.targetPage,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("-OR Continue with", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialLoginButton('assets/images/google_logo.png', 'Google Login', Colors.red),
            const SizedBox(width: 20),
            _buildSocialLoginButton('assets/images/apple_logo.png', 'Apple Login', Colors.red),
            const SizedBox(width: 20),
            _buildSocialLoginButton('assets/images/facebook_logo.png', 'Facebook Login', Colors.red),
          ],
        ),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(8),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: text),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, targetPage);  // Chuyển đến targetPage theo tên route
                    },
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginButton(String assetPath, String label, Color borderColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 2), // Viền đỏ
      ),
      child: IconButton(
        icon: Image.asset(
          assetPath,
          width: 40,
          height: 40,
        ),
        onPressed: () {
          print(label);  // In label khi người dùng nhấn
        },
      ),
    );
  }
}