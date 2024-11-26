import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginViewState();
}

class _LoginViewState extends State<SignUp> {

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
                  decoration: _buildInputDecoration("Username or Email", Icons.person),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.black),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Password", Icons.lock),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.black),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("ConfirmPassword", Icons.lock),
                  obscureText: true,
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
                        : const Text("Login",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            )),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData prefixIcon) {
    return InputDecoration(
      fillColor: Colors.white,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black)), // Viền đen khi không focus
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black)), // Viền đen khi focus
      filled: true,
      labelStyle: const TextStyle(color: Color(0xFF949494)), // Màu chữ nhãn
      labelText: label,
      prefixIcon: Icon(
        prefixIcon,
        color: const Color(0xFF949494),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      // Để màu chữ khi nhập vào là trắng, cần sử dụng `style` cho `TextField`
    );
  }
}