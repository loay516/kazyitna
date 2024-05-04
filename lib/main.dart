// ignore_for_file: unused_import, duplicate_ignore, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kaziytna/components/Home.dart';
import 'package:kaziytna/components/common/chat.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:kaziytna/components/forget_password_page.dart';
import 'package:kaziytna/components/home_screen.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:kaziytna/features/login/screens/login_page.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:kaziytna/components/signup_page.dart';
// ignore: depend_on_referenced_packages
import 'package:kaziytna/features/splash/splash_view.dart';
import 'package:kaziytna/firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}

