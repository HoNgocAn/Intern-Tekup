
import 'package:exercise_1/screens/splash_2.dart';
import 'package:flutter/material.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

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
                    "1/3",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Splash2()),
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
                  "https://media.istockphoto.com/id/1481108336/vi/vec-to/nh%C3%A2n-v%E1%BA%ADt-ho%E1%BA%A1t-h%C3%ACnh-c%E1%BB%A7a-nh%E1%BB%AFng-ng%C6%B0%E1%BB%9Di-b%E1%BA%A1n-n%E1%BB%AF-ch%E1%BB%8Dn-qu%E1%BA%A7n-%C3%A1o-m%E1%BB%9Bi-trong-c%E1%BB%ADa-h%C3%A0ng.jpg?s=1024x1024&w=is&k=20&c=JLxUg3pIJpyVnT2Gn3JKWiUYg-cCXrsIimxp_j4Q6vw=",
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
                  "Choose Products",
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
                  const SizedBox(
                    width: 80.0,
                  ),
                  Row(
                    children: List.generate(3, (index) {
                      // Chỉ mục trang hiện tại
                      bool isSelected = index == 0;
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
                        MaterialPageRoute(builder: (context) => const Splash2()),
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
