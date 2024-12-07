import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false; // To toggle between view and edit mode

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController(text: "+1234567890");

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Load user data when the screen is initialized
  }

  void _loadUserData() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      _emailController.text = user.email ?? "No Email Found";
      _nameController.text = user.displayName ?? "Nimashi Sulakkana";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 8, 60, 93),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            color: Colors.white,  // Change Icon color here
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
              if (!isEditing) {
                // Save logic goes here
                // For example: update user data in the database or call an API
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/profile.jpg"), // Placeholder image
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField("Name", _nameController, isEditing),
            const SizedBox(height: 10),
            _buildTextField("Email", _emailController, false), // Email is not editable
            const SizedBox(height: 10),
            _buildTextField("Phone", _phoneController, isEditing),
            const SizedBox(height: 30),
            if (isEditing)
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 8, 60, 93),
                  ),
                  onPressed: () {
                    // Save logic for updating user details
                    setState(() {
                      isEditing = false;
                    });
                    // Code to save updated data can go here
                  },
                  child: const Text("Save Changes", style: TextStyle(color: Colors.white)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool enabled) {
    return TextField(
      controller: controller,
      enabled: enabled,
      style: TextStyle(
      color: enabled ? Colors.black : const Color.fromARGB(255, 87, 87, 87),  // Set text color to black if editable, grey if not
    ),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 8, 60, 93),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
