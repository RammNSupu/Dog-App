import 'package:app_for_pet/screens/CategoryItemsScreen.dart';
import 'package:app_for_pet/screens/ItemDetailsScreen.dart';
import 'package:app_for_pet/screens/ProductCatalogScreen.dart';
import 'package:app_for_pet/screens/cart_screen.dart';
import 'package:app_for_pet/screens/common_allergies_screen.dart';
import 'package:app_for_pet/screens/edu_content_screen.dart';
import 'package:app_for_pet/screens/feeding_schedules_screen.dart';
import 'package:app_for_pet/screens/nutrition_tips_screen.dart';
import 'package:app_for_pet/screens/profile_screen.dart';
import 'package:app_for_pet/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 60, 93), // Updated color for app bar
        title: const Text('PuroPet', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white), // Hamburger icon color
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 8, 60, 93)), // Updated color for drawer header
              child: Text('Hello there,',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.pets, color: Color.fromARGB(255, 29, 39, 49)),
              title: const Text('Product Catalog'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductCatalogScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.article, color: Color.fromARGB(255, 29, 39, 49)),
              title: const Text('Educational Content'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EducationalContentScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Color.fromARGB(255, 29, 39, 49)),
              title: const Text('Profile'),
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
                // Navigate to Profile Management
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color.fromARGB(255, 29, 39, 49)),
              title: const Text('Log Out'),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
              );
            },
                // Log out functionality
              
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to PuroPet',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 60, 93)), // Updated text color
              ),
            ),
      
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 1.0, bottom: 8.0),
              child: Text('Explore high-quality food options for your dog',
                  style: TextStyle(color: Color.fromARGB(255, 49, 29, 29))),
            ),
            const Divider(),
            _buildSectionHeader(context, 'Shop by Category'),
            _buildProductCategories(context),
             // Add the offer image here
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/canva10.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
            const Divider(),
            _buildSectionHeader(context, 'Recommended for You'),
            _buildRecommendedProducts(context),
            const Divider(),
            _buildDogNutritionSection(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 8, 60, 93), // Updated bottom navigation color
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductCatalogScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                  // Navigate to Account
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 8, 60, 93), // Updated section header color
        ),
      ),
    );
  }

  Widget _buildProductCategories(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryCard(context, 'Puppy Food'),
          _buildCategoryCard(context, 'Adult Food'),
          _buildCategoryCard(context, 'Snack & Treats'),
          _buildCategoryCard(context, 'Special Diets'),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String categoryName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryItemsScreen(
              categoryName: categoryName,
              category: '',
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 8, 60, 93), // Updated card background color
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              categoryName,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedProducts(BuildContext context) {
    return Column(
      children: [
        _buildRecommendedProductCard(
          context,
          'Chicken & vege chunks',
          'Pedigree',
          'Rs.580.00',
          'Super soft for our soft puppies',
          'assets/images/dogfood1.webp',
          'Chicken, Rice, Fish Oil, Vege flavours',
          'Great for skin, Promotes growth',
        ),
        _buildRecommendedProductCard(
          context,
          'Chicken & Liver chunks',
          'Pedigree',
          'Rs.400.00',
          'A balanced diet for adult dogs',
          'assets/images/dogfood2.webp',
          'chicken, Sweet Potatoes, Carrots',
          'High protein, Good for digestion',
        ),
          _buildRecommendedProductCard(
          context,
          'Chuncks in gravy',
          'Pedigree',
          'Rs.900.00',
          'Nutrition for senior dogs',
          'assets/images/dogfood3.webp',
          'Lamb, Brown Rice, Flaxseed',
          'support, Easy to chew',
        ),
        _buildRecommendedProductCard(
          context,
          'NuturCroq chicken & rice',
          'Happy Dog',
          'Rs.1600.00',
          'High-quality ingredients',
          'assets/images/happydog1.jpg',
          'Rice flour, maize flour, barley',
          '68% of animal protein',
        ),
      
      ],
    );
  }

  Widget _buildRecommendedProductCard(BuildContext context, String itemName, String brandName, String price, String description, String imagePath, String ingredients, String pros) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(
              itemName: itemName,
              brandName: brandName,
              itemPrice: price,
              itemDescription: description,
              imagePath: imagePath,
              ingredients: ingredients,
              pros: pros,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 8, 60, 93)),
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 255, 187, 57), // Updated product card background color
          ),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 8, 60, 93), // Updated text color
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$brandName - $price',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 29, 39, 49),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(color: Color.fromARGB(255, 29, 39, 49)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDogNutritionSection(BuildContext context) {
    return Column(
      children: [
        _buildNutritionOptionCard(context, 'Nutrition Tips', NutritionTipsScreen()),
        _buildNutritionOptionCard(context, 'Feeding Schedules', FeedingSchedulesScreen()),
        _buildNutritionOptionCard(context, 'Common Allergies', CommonAllergiesScreen()),
      ],
    );
  }

  Widget _buildNutritionOptionCard(BuildContext context, String title, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 29, 39, 49), // Updated color for the nutrition card
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}