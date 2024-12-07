
import 'package:app_for_pet/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 60, 93),  // Top color
              Color.fromARGB(255, 29, 39, 49), // Bottom color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Section
            Column(
              children: [
                const SizedBox(height: 100), // Space at the top
                const Text(
                  'PuroPet',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Discover premium nutrition options\nFor Your Beloved Companion',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),

                // 'Let's Explore' Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignInScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const  Color.fromARGB(255, 255, 187, 57),  // Updated button color
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Let's Explore",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,  // Updated text color for contrast
                    ),
                  ),
                ),
              ],
            ),

            // Bottom Section with Image
            Padding(
              padding: const EdgeInsets.only(bottom: 120), // Space at the bottom
              child: Image.asset(
                'assets/images/PuroPet__3_-removebg-preview.png',
                height: 300,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
