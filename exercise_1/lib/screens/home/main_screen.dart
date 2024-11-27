import 'package:exercise_1/screens/home/home_page.dart';
import 'package:exercise_1/screens/home/search.dart';
import 'package:exercise_1/screens/home/settings.dart';
import 'package:exercise_1/screens/home/wishlists.dart';
import 'package:flutter/material.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;

  @override
  void initState() {
    page = [
      const HomePage(),
      const Wishlists(),
      const Scaffold(),
      const Search(),
      const Settings(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 5,
        iconSize: 32,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.black45,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn-icons-png.flaticon.com/512/846/846449.png",
              height: 30,
              color: selectedIndex == 0 ? Colors.pinkAccent : Colors.black45,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: selectedIndex == 1 ? Colors.pinkAccent : Colors.black45,
            ),
            label: "Wishlists",
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://banner2.cleanpng.com/20180426/jxq/avez1anz5.webp",
              height: 30,
              color: selectedIndex == 2 ? Colors.pinkAccent : Colors.black45,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn3.iconfinder.com/data/icons/feather-5/24/search-512.png",
              height: 30,
              color: selectedIndex == 3 ? Colors.pinkAccent : Colors.black45,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn-icons-png.flaticon.com/512/3524/3524659.png",
              height: 30,
              color: selectedIndex == 4 ? Colors.pinkAccent : Colors.black45,
            ),
            label: "Settings",
          ),
        ],
      ),
      body: page[selectedIndex],
    );
  }
}
