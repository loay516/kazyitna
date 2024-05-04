import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String password;
  final String phoneNo;
  final String name;

  UserModel({required this.email, required this.password, required this.phoneNo, required this.name});
  
  Map<String, dynamic> toJson() {
    return {
      "userName": name,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      name: data["userName"],
      password:data["Password"],
      phoneNo:data["Phone"],
      email: data["Email"],
    );
  }
}