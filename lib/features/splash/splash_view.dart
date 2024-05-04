// ignore_for_file: library_private_types_in_public_api, unused_import, duplicate_ignore

// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kaziytna/components/HomePage.dart';
// ignore: unused_import
import 'package:kaziytna/components/forget_password_page.dart';
import 'package:kaziytna/components/home_screen.dart';
// ignore: unused_import
import 'package:kaziytna/features/login/screens/login_page.dart';
// ignore: unused_import
import 'package:kaziytna/components/signup_page.dart';
// ignore: unused_import
import 'package:kaziytna/features/splash/splash_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SplashScreen({Key? key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  
  @override
  void initState() {
    super.initState();
    // ignore: prefer_const_constructors
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        // ignore: prefer_const_constructors
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    // ignore: prefer_const_declarations
    final double amplitude = 70.0; // ارتفاع الحركة
    // ignore: unused_local_variable, prefer_const_declarations
    final double frequency = 6.0; // التردد
    _offsetAnimation = Tween<Offset>(
      // ignore: prefer_const_constructors
      begin: Offset(0, 0), // القيمة الابتدائية
      end: Offset(0, amplitude), // القيمة النهائية
    ).animate(_controller);
// ...
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 28, 90, 42),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/images.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _offsetAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: _offsetAnimation.value,
                  child: const Text(
                    'kazity',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'YourCustomFont',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
