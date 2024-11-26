
import 'package:exercise_1/screens/splash_1.dart';
import 'package:exercise_1/screens/splash_3.dart';
import 'package:flutter/material.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row trên cùng
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "2/3",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Splash3()),
                      );
                    },
                    child: const Text("Skip",  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500,  color: Colors.black,),),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
            // Nội dung chính
            Column(
              children: [
                Image.network(
                  "https://cdn.wellcare.vn/imaginary/resize?width=412&height=209.25&type=webp&url=https://storage.googleapis.com/cms-gallery/66b2ebb59a6b0b36c11056d8/cac-hinh-thu-thanh-toan.png",
                  height: 300,
                  width: 400,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/img_err.png",
                      height: 300,
                      width: 400,
                    );
                  },
                ),
                const Text(
                  "Make Payment",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
            // Row dưới cùng
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Splash1()),
                      );
                    },
                    child: const Text(
                      "Prev",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(3, (index) {
                      // Chỉ mục trang hiện tại
                      bool isSelected = index == 1;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: isSelected
                            ? Container(
                          width: 40.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        )
                            : const CircleAvatar(
                          radius: 6.0,
                          backgroundColor: Colors.grey,
                        ),
                      );
                    }),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Splash3()),
                      );
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

