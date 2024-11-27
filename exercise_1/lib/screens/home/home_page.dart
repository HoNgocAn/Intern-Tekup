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
      appBar: AppBar(title: const Text('Home Page')),
      body: Padding(
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

            // All Featured Row
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
    );
  }
}