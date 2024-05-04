import 'package:flutter/material.dart';
import 'package:kaziytna/components/Home.dart';
import 'package:kaziytna/components/HomePage.dart';
import 'package:kaziytna/components/common/chat.dart';
import 'package:kaziytna/components/home_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeUpScreen(),
    // Home(),
    HomeScreen(),
    CartPage(),
    ProfilePage(),
    ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 24, 107, 27),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_sharp),
            label: "Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fire_extinguisher_outlined),
            label: "Fire",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Message",
          ),
        ],
      ),
    );
  }
}
