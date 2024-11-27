import 'package:exercise_1/screens/auth/login.dart';
import 'package:flutter/material.dart';

import '../../utils/appvalidator.dart';
import '../../widgets/button_auth.dart';
import '../../widgets/custom_input_decoration.dart';
import '../../widgets/logo_in_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
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
          isLoader = false;
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
                      "Create an account",
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
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    style: const TextStyle(color: Colors.black),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: customInputDecoration(
                      label: "ConfirmPassword",
                      prefixIcon: Icons.lock,
                    ),
                    obscureText: true,
                    validator: appValidator.validatePassword,
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerLeft, // Căn trái
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.grey), // Màu chữ mặc định
                        children: <TextSpan>[
                          TextSpan(
                            text: 'By clicking the ',
                          ),
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(color: Colors.orange),
                          ),
                          TextSpan(
                            text: ' button, you agree to the public offer', // Phần còn lại của câu
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  ButtonAuth(
                    isLoader: isLoader,
                    onPressed: _submitForm,
                    buttonText: "Create Account", // Văn bản của nút
                  ),
                  const SizedBox(height: 60.0),
                  const LogoInAuth(
                    text: "I Already Have an Account? ",
                    targetPage: '/login',
                    buttonText: "Login",
                  ),
                ],
              )),
        ),
      ),
    );
  }
}