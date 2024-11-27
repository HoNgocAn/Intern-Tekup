import 'package:exercise_1/screens/auth/login.dart';
import 'package:flutter/material.dart';

class UnifiedSplashScreen extends StatefulWidget {
  const UnifiedSplashScreen({super.key});

  @override
  _UnifiedSplashScreenState createState() => _UnifiedSplashScreenState();
}

class _UnifiedSplashScreenState extends State<UnifiedSplashScreen> {
  final List<Map<String, String>> splashData = [
    {
      "title": "Choose Products",
      "description":
      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit",
      "image":
      "https://img.lovepik.com/free-png/20220118/lovepik-man-is-choosing-clothes-png-image_401483096_wh860.png"
    },
    {
      "title": "Make Payment",
      "description":
      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit",
      "image":
      "https://cdn.wellcare.vn/imaginary/resize?width=412&height=209.25&type=webp&url=https://storage.googleapis.com/cms-gallery/66b2ebb59a6b0b36c11056d8/cac-hinh-thu-thanh-toan.png"
    },
    {
      "title": "Get Your Order",
      "description":
      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit",
      "image":
      "https://i0.wp.com/crmviet.vn/wp-content/uploads/2019/10/shopping-cloth-store_42515-328.jpg?ssl=1"
    },
  ];

  // Khai báo PageController
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController, // Gán controller cho PageView
          itemCount: splashData.length,
          itemBuilder: (context, index) {
            final data = splashData[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${index + 1}/${splashData.length}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (index != splashData.length - 1)
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginView())
                            );
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
                // Main Content
                Column(
                  children: [
                    Image.network(
                      data["image"]!,
                      height: 300,
                      width: 400,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/img_err.png',
                            height: 300, width: 400);
                      },
                    ),
                    Text(
                      data["title"]!,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        data["description"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
                // Footer
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (index != 0)
                        GestureDetector(
                          onTap: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
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
                        )
                      else

                        const SizedBox(width: 60),

                      Row(
                        children: List.generate(splashData.length, (i) {
                          bool isSelected = i == index;
                          return Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
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
                          if (index != splashData.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          } else {
                            // Xử lý hành động khi hoàn tất
                          }
                        },
                        child: Text(
                          index == splashData.length - 1
                              ? "Get Started"
                              : "Next",
                          style: const TextStyle(
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
            );
          },
        ),
      ),
    );
  }
}