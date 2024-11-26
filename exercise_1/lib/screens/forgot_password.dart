import 'package:flutter/material.dart';

import '../widgets/custom_input_decoration.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _LoginViewState();
}

class _LoginViewState extends State<ForgotPassword> {

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
          isLoader = false; // Ẩn loader sau khi hoàn tất
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
                  alignment: Alignment.centerLeft, // Căn trái
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.grey), // Màu chữ mặc định
                      children: <TextSpan>[
                        TextSpan(
                          text: ' * ', // Dấu * màu đỏ
                          style: TextStyle(color: Colors.red), // Màu đỏ cho dấu *
                        ),
                        TextSpan(
                          text: 'We will send you a message to set or reset or new password',
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
                        : const Text("Submit",
                      style: TextStyle(color: Colors.white, fontSize: 25 ,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            )),
      ),
    );
  }

}