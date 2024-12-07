import 'package:app_for_pet/screens/CheckoutScreen.dart';
import 'package:app_for_pet/screens/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ItemDetailScreen extends StatefulWidget {
  final String itemName;
  final String brandName;
  final String itemPrice;
  final String itemDescription;
  final String imagePath;
  final String ingredients;
  final String pros;
  
  

  const ItemDetailScreen({
    super.key,
    required this.itemName,
    required this.brandName,
    required this.itemPrice,
    required this.itemDescription,
    required this.imagePath,
    required this.ingredients,
    required this.pros,
   
  });

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int quantity = 1;

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  void _showAddToCartBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              height: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemName,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  
                  // Quantity Controls in Bottom Sheet
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setModalState(() {
                              quantity--;
                            });
                            setModalState(() {}); // Update the modal view
                          }
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text(
                        '$quantity',
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {
                          setModalState(() {
                            quantity++;
                          });
                          setModalState(() {}); // Update the modal view
                        },
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                  
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      final cartItem = {
                        'name': widget.itemName,
                        'brandName': widget.brandName,
                        'price': widget.itemPrice,
                        'description': widget.itemDescription,
                        'imagePath': widget.imagePath,
                        'ingredients': widget.ingredients,
                        'pros': widget.pros,
                        'quantity': quantity,
                      };
                      Provider.of<CartProvider>(context, listen: false).addToCart(cartItem);
                      Navigator.pop(context); // Close the bottom sheet
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${widget.itemName} added to cart')),
                      );
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                    child: Text('Confirm Add to Cart (Quantity: $quantity)'), // Display quantity
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 8, 60, 93),
        title: Text(widget.itemName,style: const TextStyle(color: Colors.white))),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  widget.imagePath,
                  height: 400,
                  width: 400,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.brandName,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(widget.itemName, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text(widget.itemPrice, style: const TextStyle(fontSize: 19, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold,)),
              const SizedBox(height: 16),
              Text(widget.itemDescription),
              const SizedBox(height: 16),
              const Text('Ingredients', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(widget.ingredients),
              const SizedBox(height: 16),
              const Text('Pros', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(widget.pros),
          
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => _showAddToCartBottomSheet(context),
                child: const Text('Add to Cart',
                 style: TextStyle(color:   Color.fromARGB(255, 8, 60, 93))
                 ),







              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(
                      items: [
                        {
                          'name': widget.itemName,
                          'brandName': widget.brandName,
                          'price': widget.itemPrice,
                          'description': widget.itemDescription,
                          'imagePath': widget.imagePath,
                          'quantity': quantity,
                        },
                      ],
                    ),
                  ),
                );
                  
                  // Buy Now functionality
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 187,57)),
                child: const Text('Buy Now',
                 style: TextStyle(color:   Color.fromARGB(255, 8, 60, 93))
                 ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
