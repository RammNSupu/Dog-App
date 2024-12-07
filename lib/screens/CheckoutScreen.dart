
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>>? items;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardExpiryController = TextEditingController();
  final TextEditingController cardCVVController = TextEditingController();

  CheckoutScreen({super.key, this.items});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = items ?? cartProvider.cartItems;
    
    // Calculate delivery charge and total price
    double deliveryCharge = 100.0;
    double totalPrice = cartItems.fold(0, (sum, item) => sum + double.parse(item['price'].substring(3)) * item['quantity']);
    double grandTotal = totalPrice + deliveryCharge;

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 8, 60, 93),
        title: const Text('Checkout', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Order Summary', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(item['imagePath'], width: 50, height: 50, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['name'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text('Rs. ${item['price'].substring(3)}', style: const TextStyle(color: Color.fromARGB(255, 2, 2, 2))),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle_outline),
                                      onPressed: () {
                                        if (item['quantity'] > 1) {
                                          cartProvider.updateQuantity(item, item['quantity'] - 1);
                                        }
                                      },
                                    ),
                                    Text('${item['quantity']}'),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle_outline),
                                      onPressed: () {
                                        cartProvider.updateQuantity(item, item['quantity'] + 1);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Divider(),
              const Text('Delivery Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(controller: addressController, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter your delivery address')),
              const SizedBox(height: 20),
              const Text('Payment Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(controller: cardNumberController, keyboardType: TextInputType.number, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Card Number')),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: cardExpiryController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'MM/YY'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: cardCVVController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'CVV'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal:', style: TextStyle(fontSize: 16)),
                    Text('Rs. ${totalPrice.toStringAsFixed(2)}'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Delivery Charge:', style: TextStyle(fontSize: 16)),
                  Text('Rs. ${deliveryCharge.toStringAsFixed(2)}'),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Grand Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Rs. ${grandTotal.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async{
                    // Confirm the order after filling the details
                    if (addressController.text.isNotEmpty && cardNumberController.text.isNotEmpty) {
                      await saveOrderToFirestore(cartItems, addressController.text, grandTotal);
                      cartProvider.clearCart();
                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Order submitted successfully')),
                      );
                      Navigator.pop(context); // Return to the previous screen
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill in all details')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(255, 8, 60, 93),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Confirm Purchase', style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Save order to Firestore (called upon confirming the purchase)
  Future<void> saveOrderToFirestore(List<Map<String, dynamic>> cartItems, String address, double totalPrice) async {
    final orderRef = FirebaseFirestore.instance.collection('orders').doc();
    final orderData = {
      'items': cartItems,
      'address': address,
      'totalPrice': totalPrice,
      'timestamp': FieldValue.serverTimestamp(),
    };
    await orderRef.set(orderData);
  }
}