// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaziytna/core/repository/authenticationReporsitory/authenticationRepository.dart';
import 'package:kaziytna/features/home/screens/home_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';


class SignUpController extends GetxController{
  static SignUpController get Instance =>Get.find();

  //textfield controllers to get data from textfields
  final email =TextEditingController();
  final password =TextEditingController();
  final fullName =TextEditingController();
  final phoneNo =TextEditingController();
  final userRepo=Get.put(AuthenticationRepository());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //call this fun from design and it will do the rest
//   void registerUser(String email,String password)
//   {
//     AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    
//   }

//  Future<void> createUser(UserModel user,)async{
//   await userRepo.createUser(user);
//   }
//   void phoneAuthentication(String phoneNo){
//     AuthenticationRepository.instance.phoneAuthentication(phoneNo);
//   }

//   Future<void> signOut() async {
//   try {
//     await AuthenticationRepository.instance.logout();
//     // Navigate to the login or home screen after successful logout
//     // For example:
//     // Navigator.pushReplacementNamed(context, '/login');
//   } catch (e) {
//     print("Error during sign out: $e");
//   }
// }

// Future<void> signIn(String email,String password) async {
//     try {
//       await AuthenticationRepository.instance.loginWithEmailAndPassword(
//           email, password);
//       // Navigate to the home screen or perform other actions after successful login
//       // For example:
//       // Navigator.pushReplacementNamed(context, '/home');
//     } catch (e) {
//       print("Error during login: $e");
//       // Handle login error, show a message, etc.
//     }
//   }

  //  Future<void> loginDriver(String email,String password,BuildContext context) async {
  //   try {
  //     final UserCredential userCredential =
  //         await _auth.signInWithEmailAndPassword(
  //       email: email.trim(),
  //       password: password,
  //     );
  //     final User? user = userCredential.user;
      
  //     if (user != null) {
  //       // Save user email to SharedPreferences
  //       final prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('user_email', user.email.toString());
  //       ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('succces to log in.'),
  //       ),
  //     );
  //       Get.to(() => DriverHome());
  //       // Navigate to the next screen or perform other actions
  //       // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
  //     }
  //   } catch (e) {
  //     // Handle login errors
  //     print('Login error: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Failed to log in. Please try again.'),
  //       ),
  //     );
  //   }
  // }
  Future<void> loginResturant(String email,String password,BuildContext context) async {
    try {
      print('xxxxxxxxxxxxxxxxxxxxxxxxxx');
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      
      if (user != null) {
        // Save user email to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_email', user.email.toString());
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('succces to log in.'),
        ),
      );
        // Get.to(() => MyHomePage());
        Navigator.pushReplacement(
        context,
        // ignore: prefer_const_constructors
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
        // Navigate to the next screen or perform other actions
        // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
      }
    } catch (e) {
      // Handle login errors
      print('Login error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to log in. Please try again.'),
        ),
      );
    }
  }

   
}