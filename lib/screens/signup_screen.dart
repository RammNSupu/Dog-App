import 'package:app_for_pet/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Email validation pattern
  final RegExp emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  // Minimum eight characters, at least one letter, one number, and one special character
  final RegExp passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

  // Validators
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    } else if (!passwordRegExp.hasMatch(password)) {
      return 'Password must be at least 8 characters, include a number, a letter, and a special character';
    }
    return null;
  }

  String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  // Sign Up logic
  void _signUp() {
    if (_formKey.currentState?.validate() == true) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailTextController.text,
              password: _passwordTextController.text)
          .then((value) {
        print("Created New Account");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      }).onError((error, stackTrace) {
        print("Error ${error.toString()}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign Up Failed: ${error.toString()}")),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 16, 16),
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 8, 60, 93),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  // Username Field
                  TextFormField(
                    controller: _userNameTextController,
                    decoration: InputDecoration(
                      labelText: "Enter Username",
                      labelStyle: TextStyle(color:Colors.white.withOpacity(0.9)),
                      prefixIcon: const Icon(Icons.person_outline, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Color.fromARGB(255, 220, 219, 219)), // Text being typed
                    validator: validateUsername,
                  ),
                  const SizedBox(height: 20),

                  // Email Field
                  TextFormField(
                    controller: _emailTextController,
                    decoration: InputDecoration(
                      labelText: "Enter Email Id",
                      labelStyle: TextStyle(color:Colors.white.withOpacity(0.9)),
                      prefixIcon: const Icon(Icons.email_outlined, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white),
                    validator: validateEmail,
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  TextFormField(
                    controller: _passwordTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      labelStyle: TextStyle(color:Colors.white.withOpacity(0.9)),
                      prefixIcon: const Icon(Icons.lock_outlined, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: validatePassword,
                  ),
                  const SizedBox(height: 30),

                  // Sign Up Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 255, 187, 57),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 140, vertical: 10),
                    ),
                    onPressed: _signUp,
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(fontSize: 16, color: Colors.black87,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
