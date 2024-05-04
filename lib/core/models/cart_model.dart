import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String cartId;

  CartModel({required this.cartId,});

  Map<String, dynamic> toJson() {
    return {
      "userEmail": cartId,
    };
  }

  factory CartModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return CartModel(
      cartId: data["userEmail"],
    );
  }
}