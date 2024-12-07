import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  get cartItemCount => null;

  void addToCart(Map<String, dynamic> item) {
    final existingItemIndex = _cartItems.indexWhere((cartItem) => cartItem['name'] == item['name']);
    if (existingItemIndex >= 0) {
      _cartItems[existingItemIndex]['quantity'] += item['quantity'];
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void updateQuantity(Map<String, dynamic> item, int quantity) {
    final existingItemIndex = _cartItems.indexWhere((cartItem) => cartItem['name'] == item['name']);
    if (existingItemIndex >= 0) {
      _cartItems[existingItemIndex]['quantity'] = quantity;
      notifyListeners();
    }
  }

  Future<void> saveOrderToFirestore() async {
  print("Saving order to Firestore");
  try {
    // 1. Get the current user's UID and email
    final user = FirebaseAuth.instance.currentUser;
    final userEmail = user?.email; // Get the email
    final userUid = user?.uid; // Get the UID

    if (user == null) {
      print("No user is signed in.");
      return; // Optional: Handle the case where no user is logged in
    }
    final order = {
      'items': _cartItems.map((item) {
        print("Item in cart: $item");
        // Ensure 'price' is a double and 'quantity' is an int
        return {
          'name': item['name'],
          'imagePath': item['imagePath'],
          'price': (item['price'] ?? 0.0) is double ? item['price'] : double.tryParse(item['price'].toString()) ?? 0.0,
          'quantity': (item['quantity'] ?? 0) is int ? item['quantity'] : int.tryParse(item['quantity'].toString()) ?? 0,
        };
      }).toList(),
      'totalPrice': _cartItems.fold<double>(
        0.0,
        (sum, item) => sum + (double.tryParse(item['price'].toString()) ?? 0.0) * (item['quantity'] ?? 0),
      ),
      'orderDate': Timestamp.now(),
      'userEmail': userEmail, // Add the email of the user who made the order
      'userUid': userUid, // Add the UID of the user who made the orde
    };

    print("order data to be saved: $order");

    await FirebaseFirestore.instance.collection('orders').add(order);
    _cartItems.clear();
    notifyListeners();
    print("Order saved Successfully");
  } catch (e) {
    print("Error saving order: $e");
  }
}

  void clearCart() {}

}
