import 'package:exercise_1/screens/auth/sign_up.dart';
import 'package:exercise_1/widgets/logo_in_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/appvalidator.dart';
import '../../widgets/button_auth.dart';
import '../../widgets/custom_input_decoration.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;  // Bắt đầu hiển thị loader
      });

      try {

      } catch (e) {
        // Handle any exceptions here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() {
          isLoader = false; // Ẩn loader sau khi hoàn tất
        });
      }
    }
  }

  final appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.white ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome Back!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: customInputDecoration(
                      label: "Username or Email",
                      prefixIcon: Icons.person,
                    ),
                    validator: appValidator.validateEmail,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(color: Colors.black),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: customInputDecoration(
                      label: "Password",
                      prefixIcon: Icons.lock,
                    ),
                    obscureText: true,
                    validator: appValidator.validatePassword,
                  ),
                  const SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgotPassword');  // Điều hướng tới trang ForgotPassword
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  ButtonAuth(
                    isLoader: isLoader,
                    onPressed: _submitForm,
                    buttonText: "Login", // Văn bản của nút
                  ),
                  const SizedBox(height: 60.0),
                  const LogoInAuth(
                    text: "Create An Account ",
                    targetPage: '/signUp',
                    buttonText: "Sign Up",
                  ),
                ],
              )),
        ),
      ),
    );
  }

}