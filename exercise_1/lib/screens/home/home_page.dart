import 'package:flutter/material.dart';

import 'package:exercise_1/widgets/search_bar.dart' as custom;

import '../../model/category.dart';
import '../../model/product.dart';
import '../../widgets/product_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVDpeBW0W6qVli5Y_UxAwZ7FBgMbSlwi7fMw&s",
              height: 40,
              fit: BoxFit.cover,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Hành động khi nhấn vào ảnh tài khoản
                print("Avatar clicked");
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/img_user.png"), // Sử dụng AssetImage thay vì Image.asset
                radius: 20, // Bạn có thể điều chỉnh radius để thay đổi kích thước của CircleAvatar
              ),
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Đảm bảo context đúng
            },
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề (ảnh)
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Xử lý khi nhấn vào mục Home
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Xử lý khi nhấn vào mục Settings
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              custom.SearchBar(
                onSearch: (value) {
                  print("Searching for: $value");
                },
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Featured",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          print("Sort button pressed");
                        },
                        icon: const Icon(Icons.sort),
                        label: const Text("Sort"),
                      ),
                      const SizedBox(width: 8),
                      TextButton.icon(
                        onPressed: () {
                          print("Filter button pressed");
                        },
                        icon: const Icon(Icons.filter_list),
                        label: const Text("Filter"),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),
              // Horizontal Category List
              SizedBox(
                height: 120, // Chiều cao của thanh ngang
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Cuộn ngang
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    final category = categoriesList[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0), // Khoảng cách giữa các item
                      child: Column(
                        children: [
                          // Hình ảnh danh mục
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40), // Bo tròn
                              image: DecorationImage(
                                image: NetworkImage(category.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Tiêu đề danh mục
                          Text(
                            category.title,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              ClipRRect(
                borderRadius:  BorderRadius.circular(20),
                child: Stack(
                  children: [
                    // Ảnh nền
                    Image.asset(
                      'assets/images/logo_1_home.png',  // Đảm bảo đường dẫn đúng
                      width: double.infinity,  // Chiếm toàn bộ chiều rộng màn hình
                      height: 200,  // Chiều cao ảnh
                      fit: BoxFit.cover,  // Cách hiển thị ảnh
                    ),
                    // Dòng chữ bên trái ảnh
                    const Positioned(
                      left: 20,  // Khoảng cách từ bên trái
                      top: 30,   // Khoảng cách từ trên xuống
                      child: Text(
                        '50 - 40 OFF ',
                        style: TextStyle(
                          color: Colors.white,  // Màu chữ trắng
                          fontSize: 24,  // Kích thước chữ
                          fontWeight: FontWeight.bold,  // Đậm
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 20,  // Khoảng cách từ bên trái
                      top: 70,   // Khoảng cách từ trên xuống, vị trí dưới dòng chữ lớn
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Now in (product)',
                            style: TextStyle(
                              color: Colors.white,  // Màu chữ trắng
                              fontSize: 16,  // Kích thước chữ nhỏ hơn
                              fontWeight: FontWeight.normal,  // Mỏng
                            ),
                          ),
                          SizedBox(height: 5),  // Khoảng cách giữa các dòng chữ
                          Text(
                            'All Colours',
                            style: TextStyle(
                              color: Colors.white,  // Màu chữ trắng
                              fontSize: 16,  // Kích thước chữ nhỏ hơn nữa
                              fontWeight: FontWeight.normal,  // Mỏng
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Nút "Shop Now"
                    Positioned(
                      bottom: 20,  // Khoảng cách từ dưới lên
                      left: 20,    // Khoảng cách từ bên trái
                      child: TextButton(
                        onPressed: () {
                          // Hành động khi nhấn nút "Shop Now"
                          print('Shop Now pressed');
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          side: const BorderSide(color: Colors.white, width: 2),  // Viền trắng
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),  // Bo góc của nút
                          ),
                        ),
                        child: const Text(
                          'Shop Now',
                          style: TextStyle(
                            color: Colors.white,  // Màu chữ trắng
                            fontSize: 18,  // Kích thước chữ
                            fontWeight: FontWeight.bold,  // Đậm
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    // Màu nền xanh (blue)
                    Container(
                      width: double.infinity,  // Chiếm toàn bộ chiều rộng màn hình
                      height: 70,  // Chiều cao của phần tử
                      color: Colors.blue,  // Màu nền xanh
                    ),
                    // Dòng chữ và nút "View All" chia làm 2 cột
                    Positioned(
                      left: 20,  // Khoảng cách từ bên trái
                      top: 10,   // Khoảng cách từ trên xuống
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Căn giữa và phân bố không gian
                        children: [
                          // Cột chứa các dòng chữ
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deal of the day ',
                                style: TextStyle(
                                  color: Colors.white,  // Màu chữ trắng
                                  fontSize: 20,  // Kích thước chữ
                                  fontWeight: FontWeight.bold,  // Đậm
                                ),
                              ),
                              Text(
                                '22h 55m 20s remaining',
                                style: TextStyle(
                                  color: Colors.white,  // Màu chữ trắng
                                  fontSize: 16,  // Kích thước chữ nhỏ hơn
                                  fontWeight: FontWeight.normal,  // Mỏng
                                ),
                              ),
                            ],
                          ),
                          // Cột chứa nút "View All" được căn về bên phải
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: TextButton(
                              onPressed: () {
                                // Hành động khi nhấn nút "View All"
                                print('View All pressed');
                              },
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                side: const BorderSide(color: Colors.white, width: 2),  // Viền trắng
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),  // Bo góc của nút
                                ),
                              ),
                              child: const Text(
                                'View All',
                                style: TextStyle(
                                  color: Colors.white,  // Màu chữ trắng
                                  fontSize: 18,  // Kích thước chữ
                                  fontWeight: FontWeight.bold,  // Đậm
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 250, // Fixed height for the product cards
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    final product = productList[index];
                    return ProductCard(product: product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}