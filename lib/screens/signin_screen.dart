import 'package:app_for_pet/screens/home_screen.dart';
import 'package:app_for_pet/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 8, 60, 93), // Use a single color for background
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Design with "Welcome Back" text
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipPath(
                    clipper: CustomShape(),
                    child: Container(
                      height: 330,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color:  Color.fromARGB(255, 255, 187, 57),
                      ),
                      alignment: Alignment.topCenter,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF02457A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 75,
                    backgroundColor: const Color.fromARGB(255, 8, 60, 93),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/cutedog-removebg-preview.png",
                        fit: BoxFit.cover,
                        width: 130,
                        height: 140,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150),

              // Form Area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Field
                      TextFormField(
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          
                          labelStyle: TextStyle(color:Colors.white.withOpacity(0.9)),
                          prefixIcon: const Icon(Icons.person_outline, color: Colors.white70),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                           border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                      
                        ),
                          style: const TextStyle(color: Color.fromARGB(255, 220, 219, 219)), // Text being typed
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      TextFormField(
                        controller: _passwordTextController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password should be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      // Sign In Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  const Color.fromARGB(255, 255, 187, 57),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 140, vertical: 10),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: _emailTextController.text.trim(),
                                password: _passwordTextController.text.trim(),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Sign-in failed: ${e.toString()}')),
                              );
                            }
                          }
                        },
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(fontSize: 16, color: Colors.black87,fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Sign Up Option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              " Sign Up",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 187, 57),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Shape for "Welcome Back!" Background
class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2, size.height,
      size.width, size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
