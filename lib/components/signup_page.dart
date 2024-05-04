import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaziytna/components/common/custom_form_button.dart';
import 'package:kaziytna/components/common/custom_input_field.dart';
import 'package:kaziytna/components/common/page_header.dart';
import 'package:kaziytna/components/common/page_heading.dart';
import 'package:kaziytna/core/models/user_model.dart';
import 'package:kaziytna/core/repository/authenticationReporsitory/authenticationRepository.dart';
import 'package:kaziytna/core/repository/cartrepository/cart_repository.dart';
import 'package:kaziytna/features/login/screens/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordControlle=TextEditingController();
  TextEditingController _phoneNoController=TextEditingController();
  TextEditingController _nameController=TextEditingController();
  final _signupFormKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                const PageHeader(),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const PageHeading(
                        title: 'Sign-up',
                      ),
                      
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInputField(
                        controller: _nameController,
                          labelText: 'Name',
                          hintText: 'Your name',
                          isDense: true,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'Name field is required!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomInputField(
                          labelText: 'Email',
                          hintText: 'Your email id',
                          isDense: true,
                          controller: _emailController,
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
                        controller: _phoneNoController,
                          labelText: 'Contact no.',
                          hintText: 'Your contact number',
                          isDense: true,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return 'Contact number is required!';
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
                        isDense: true,
                        obscureText: true,
                        validator: (textValue) {
                          if (textValue == null || textValue.isEmpty) {
                            return 'Password is required!';
                          }
                          return null;
                        },
                        suffixIcon: true,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      CustomFormButton(
                        innerText: 'Signup',
                        onPressed: _handleSignupUser,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account ? ',
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
                                            const LoginPage()))
                              },
                              child: const Text(
                                'Log-in',
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
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 AuthenticationRepository repo= AuthenticationRepository();
 CartRepository cartRepo= CartRepository();
  void _handleSignupUser() {
    // signup user
   
    if (_signupFormKey.currentState!.validate()) {
      UserModel user=UserModel(
        email: _emailController.text, 
        password: _passwordControlle.text, 
        phoneNo: _phoneNoController.text, 
        name: _nameController.text
        );
      repo.createUserWithEmailAndPassword(user);
      repo.createUser(user);
      cartRepo.createCart(user.email);
      Navigator.pushReplacement(
        context,
        // ignore: prefer_const_constructors
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }
}
