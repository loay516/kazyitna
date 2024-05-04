import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaziytna/core/models/cart_model.dart';

class CartRepository {
  static CartRepository get instance => Get.find();

  //variables
  final _db=FirebaseFirestore.instance;

  createCart(String userId) async{
    await _db.collection("Carts").add(
      {
  "userEmail": userId,
}
    );
  }

Future<CartModel> getCart(String email)async{
    final snapshot=await _db.collection("Carts").where("userEmail",isEqualTo: email).get();
    final userData=snapshot.docs.map((e) => CartModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateCartWithNewField(String cartId, String fieldName, dynamic fieldValue) async {
  try {
    // Get a reference to the cart document
    DocumentReference cartRef = _db.collection('Cart').doc(cartId);

    // Get the current data of the cart document
    DocumentSnapshot cartSnapshot = await cartRef.get();

    // Check if the cart document exists
    if (cartSnapshot.exists) {
      // Get the current data
      Map<String, dynamic> data = cartSnapshot.data() as Map<String, dynamic>;

      // Convert the keys to a Set
      Set<String> existingFields = data.keys.toSet();

      // Generate the new field name
      String newFieldName = await generateNewFieldName(existingFields, fieldName);

      // Add the new field to the data
      data[newFieldName] = fieldValue;

      // Update the cart document with the new data
      await cartRef.update(data);
    } else {
      print('Cart document not found');
    }
  } catch (e) {
    print('Error updating cart: $e');
  }
}

Future<String> generateNewFieldName(Set<String> existingFields, String baseName) async {
  // Initialize the suffix number
  int suffix = 1;

  // Generate a new field name with a unique suffix
  String newFieldName;
  do {
    newFieldName = '$baseName$suffix';
    suffix++;
  } while (existingFields.contains(newFieldName));

  return newFieldName;
}
}