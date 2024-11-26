import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/appvalidator.dart';
import '../widgets/custom_input_decoration.dart';

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
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.pink),
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
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: isLoader
                          ? const Center(child: CircularProgressIndicator())
                          : const Text("Login",
                        style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
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
        
                      const Text("Create an Account Sign Up", style: TextStyle(fontSize: 16)),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

}