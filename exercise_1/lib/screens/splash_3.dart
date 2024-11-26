
import 'package:exercise_1/screens/splash_2.dart';
import 'package:flutter/material.dart';

class Splash3 extends StatelessWidget {
  const Splash3({super.key});

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
                    "3/3",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      // Hành động "Skip"
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
                  "https://i0.wp.com/crmviet.vn/wp-content/uploads/2019/10/shopping-cloth-store_42515-328.jpg?ssl=1",
                  height: 300,
                  width: 400,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/img_err.png', height: 300, width: 400);
                  },
                ),
                const Text(
                  "Get Your Order",
                  style: TextStyle(
                    fontSize: 24.0, // Phóng to chữ
                    fontWeight: FontWeight.bold, // Bôi đậm
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
                        MaterialPageRoute(builder: (context) => const Splash2()),
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
                      bool isSelected = index == 2; // Giả sử trang 0 là trang đang chọn
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: isSelected
                            ? Container(
                          width: 40.0, // Chiều rộng cho hình chữ nhật
                          height: 10.0, // Chiều cao cho hình chữ nhật
                          decoration: BoxDecoration(
                            color: Colors.black, // Màu cho trang hiện tại
                            borderRadius: BorderRadius.circular(5.0), // Bo tròn các góc
                          ),
                        )
                            : const CircleAvatar(
                          radius: 6.0,
                          backgroundColor: Colors.grey, // Màu cho trang chưa chọn
                        ),
                      );
                    }),
                  ),
                  GestureDetector(
                    onTap: () {
                    },
                    child: const Text(
                      "Get Started",
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


