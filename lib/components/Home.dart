// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kaziytna/components/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color.fromARGB(255, 41, 122, 44),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              size: 100,
              color: Color.fromARGB(255, 41, 122, 44),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Kazity!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 41, 122, 44),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to the new page on button press
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 41, 122, 44),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text('Start', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
