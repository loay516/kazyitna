
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaziytna/core/models/user_model.dart';
import 'package:kaziytna/core/repository/authenticationReporsitory/exceptions/signup_email_password_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth=FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId=''.obs;
  final _db=FirebaseFirestore.instance;

  @override
  void onReady() {
    firebaseUser=Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser,_setInitialScreen);
  }

  
  
  Future<void> createUserWithEmailAndPassword(UserModel user)async
  {
    try {
      await _auth.createUserWithEmailAndPassword(email: user.email, password: user.password);
      
    }on FirebaseAuthException catch (e) {
      final ex=SignUpWithEmailAndPasswordFailure.code(e.code);
      print('Firebase Auth Exception-${ex.message}');
      throw ex;
    } catch(_){
      const ex=SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }

  }
  Future<void> loginWithEmailAndPassword(String email,String password)async
  {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_email', email.toString());

        
       Get.snackbar(
        "Success",
        "User logged in successfully.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
      // Get.to(() => DriverHome());
    }on FirebaseAuthException catch (e) {
      Get.snackbar(
        "User was not found",
        "Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.redAccent,
      );
    } catch(_){}
  }
  Future<void> logout() async =>await _auth.signOut();

  createUser(UserModel user)async{
    print('xxxxxxxxxxxxxxxxxxxxxxxx');
    await _db.collection("Users").add(user.toJson()).
    whenComplete(
      () => Get.snackbar("Success", "Your account has been created.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green)
      ).catchError((error,StackTrace){
        Get.snackbar("Error", "Something went wrong.Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red
        );
        print(error.toString());
      })
      ;
  }

Future<UserModel> getUser(String email)async{
    final snapshot=await _db.collection("Users").where("Email",isEqualTo: email).get();
    final userData=snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
}