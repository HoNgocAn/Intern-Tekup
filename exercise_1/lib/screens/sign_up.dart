import 'package:flutter/material.dart';

import '../utils/appvalidator.dart';
import '../widgets/custom_input_decoration.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginViewState();
}

class _LoginViewState extends State<SignUp> {

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
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoader ? null : () {
                        _submitForm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink, // Màu nền của nút
                        foregroundColor: Colors.white, // Màu chữ (foreground)
                        textStyle: const TextStyle(fontSize: 18),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Không bo tròn
                        ),// Kích thước chữ
                      ),
                      child: isLoader
                          ? const Center(child: CircularProgressIndicator())
                          : const Text("Create Account",
                        style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Dòng chữ ở trên tất cả các logo
                      const Text("-OR Continue with", style: TextStyle(fontSize: 16,)),
        
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red, width: 2), // Viền đỏ
                            ),
                            child: IconButton(
                              icon: Image.asset(
                                'assets/images/google_logo.png',
                                width: 40,
                                height: 40,
                              ),
                              onPressed: () {
                                print("Google Login");
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Apple Icon
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red, width: 2), // Viền đỏ
                            ),
                            child: IconButton(
                              icon: Image.asset(
                                'assets/images/apple_logo.png',
                                width: 40,
                                height: 40,
                              ),
                              onPressed: () {
                                print("Apple Login");
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Facebook Icon
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.red, width: 2),
                            ),
                            child: IconButton(
                              icon: Image.asset(
                                'assets/images/facebook_logo.png',
                                width: 40,
                                height: 40,
                              ),
                              onPressed: () {
                                print("Facebook Login");
                              },
                            ),
                          ),
                        ],
                      ),
        
                      const SizedBox(height: 20),
        
                      const Text("I Already an Account Login", style: TextStyle(fontSize: 16)),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}