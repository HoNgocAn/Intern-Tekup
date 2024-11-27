import 'package:flutter/material.dart';

import '../../widgets/button_auth.dart';
import '../../widgets/custom_input_decoration.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40.0),
                const Align(
                  alignment: Alignment.centerLeft, // Căn trái
                  child: Text(
                    "Forgot password?",
                    textAlign: TextAlign.right, // Đảm bảo căn trái trong widget Text
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
                    label: "Enter your email address",
                    prefixIcon: Icons.email,
                  ),
                ),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' * ',
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text: 'We will send you a message to set or reset or new password',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                ButtonAuth(
                  isLoader: isLoader,
                  onPressed: _submitForm,
                  buttonText: "Submit",
                ),
                const SizedBox(height: 20.0),
              ],
            )),
      ),
    );
  }

}