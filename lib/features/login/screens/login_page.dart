// ignore_for_file: unused_import, prefer_const_constructors, duplicate_ignore

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kaziytna/components/Home.dart';
import 'package:kaziytna/components/HomePage.dart';
// ignore: depend_on_referenced_packages
import 'package:kaziytna/components/common/custom_form_button.dart';
// ignore: depend_on_referenced_packages
import 'package:kaziytna/components/common/custom_input_field.dart';
// ignore: depend_on_referenced_packages
import 'package:kaziytna/components/common/page_header.dart';
// ignore: depend_on_referenced_packages
import 'package:kaziytna/components/common/page_heading.dart';
// ignore: depend_on_referenced_packages
import 'package:kaziytna/components/forget_password_page.dart';
import 'package:kaziytna/components/home_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:kaziytna/components/signup_page.dart';
import 'package:kaziytna/core/repository/authenticationReporsitory/authenticationRepository.dart';
import 'package:kaziytna/core/repository/authenticationcontroller/signup_controller.dart';
import 'package:kaziytna/features/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordControlle=TextEditingController();
  //
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        const PageHeading(
                          title: 'Log-in',
                        ),
                        CustomInputField(
                          controller: _emailController,
                            labelText: 'Email',
                            hintText: 'Your email id',
                            validator: (textValue) {
                              if (textValue == null || textValue.isEmpty) {
                                return 'Email is required!';
                              }
                              if (!EmailValidator.validate(textValue)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomInputField(
                          controller: _passwordControlle,
                          labelText: 'Password',
                          hintText: 'Your password',
                          obscureText: true,
                          suffixIcon: true,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'Password is required!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: size.width * 0.80,
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgetPasswordPage()))
                            },
                            child: const Text(
                              'Forget password?',
                              style: TextStyle(
                                color: Color(0xff939393),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormButton(
                          innerText: 'Login',
                          onPressed: _handleLoginUser,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account ? ',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff939393),
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupPage()))
                                },
                                child: const Text(
                                  'Sign-up',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff748288),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
AuthenticationRepository repo= AuthenticationRepository();


void saveStringToSharedPreferences( String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
}
  void _handleLoginUser() {
    // login user
    if (_loginFormKey.currentState!.validate()) {
      saveStringToSharedPreferences(_emailController.text);
      try {
                              SignUpController.Instance.loginResturant(
                               _emailController.text.toString(),
                              _passwordControlle.text.toString(),
                              context);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('no user with this email'),
                            ),
                          );
                        }
      
    }
    
  }
}
