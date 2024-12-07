
import 'package:app_for_pet/screens/ItemDetailsScreen.dart';
import 'package:flutter/material.dart';

class ProductCatalogScreen extends StatefulWidget {
  const ProductCatalogScreen({super.key});

  @override
  _ProductCatalogScreenState createState() => _ProductCatalogScreenState();
}

class _ProductCatalogScreenState extends State<ProductCatalogScreen> {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Puppy Milk Flavor Food",
      "price": 770.00,
      "description": "Nutritious milk flavor food for puppies.",
      "category": "Puppy Food",
      "brand": "Puppy Brand",
      "imagePath": "assets/images/dogfood4.webp",
    },
    {
      "name": "Chicken Chunk in Gravy",
      "price": 310.00,
      "description": "Tender chicken chunks in gravy for puppies.",
      "category": "Puppy Food",
      "brand": "Gravy Lovers",
      "imagePath": "assets/images/dogfood1.webp",
    },
    {
      "name": "Milk flavor food",
      "price": 700.00,
      "description": "Nutritious milk flavor food for puppies.",
      "category": "Puppy Food",
      "brand": "Classic Pets",
      "imagePath": "assets/images/newiteme1.jpg",
    },
    {
      "name": "Healthy Growth",
      "price": 9000.00,
      "description": "Healthy Growth and Development puppy food contains a unique blend of live probiotic.",
      "category": "Puppy Food",
      "brand": "Purina",
      "imagePath": "assets/images/newitem2.jpg",
    },
    {
      "name": "Chicken, Egg & Milk",
      "price": 860.00,
      "description": "Growing puppies generally need a diet having a balanced nutrition for making themselves stronger and healthier.",
      "category": "Puppy Food",
      "brand": "SmartHeart",
      "imagePath": "assets/images/newitem4.jpg",
    },
    {
      "name": "Josera Kids",
      "price": 2600.00,
      "description": "Puppy food For our young Dog who want to reach the stars: a special growth formula for medium and large breeds.",
      "category": "Puppy Food",
      "brand": "Josera",
      "imagePath": "assets/images/newitem5.jpg",
    },
    {
      "name": "Fit & Vital Mini Puppy",
      "price": 2500.00,
      "description": "specially balanced complete dog food for puppies from the first month.",
      "category": "Puppy Food",
      "brand": "Happy Dog",
      "imagePath": "assets/images/newitem6.jpg",
    },
    

    {
      "name": "Adult Dog Meat & Rice",
      "price": 1950.00,
      "description": "Healthy chicken meal for adult dogs.",
      "category": "Adult Food",
      "brand": "Adult Feast",
      "imagePath": "assets/images/dogfood2.webp",
    },
     {
      "name": "Adult Dog Chicken & Egg",
      "price": 740.00,
      "description": "Offers a complete and balanced nutritional diet to your pet.",
      "category": "Adult Food",
      "brand": "Drools",
      "imagePath": "assets/images/adult1.jpg",
    },
     {
      "name": "Josi Dog Active 900g",
      "price": 1700.00,
      "description": "an energy packed dog food for adult active dogs.",
      "category": "Adult Food",
      "brand": "Happy Pet",
      "imagePath": "assets/images/adult2.jpg",
    },
     {
      "name": "Adult Dog Meat & Rice",
      "price": 1950.00,
      "description": "Meat & Rice is a healthy and complete meal for your adult dog.",
      "category": "Adult Food",
      "brand": "Pedigree",
      "imagePath": "assets/images/adult3.jpg",
    },
     {
      "name": "Josi Dog Wet Food",
      "price": 950.00,
      "description": "high-quality, balanced meal for dogs, designed to meet their nutritional needs at every life stage.",
      "category": "Adult Food",
      "brand": "Happy Pet",
      "imagePath": "assets/images/adult4.jpg",
    },
     {
      "name": "Sensitive Skin & Stomach",
      "price": 6750.00,
      "description": "Sensitive Skin and Stomach reduces the risk of these nasty tummy and skin reactions to food.",
      "category": "Adult Food",
      "brand": "Purina",
      "imagePath": "assets/images/adult5.jpg",
    },
     {
      "name": "Dog Dry Food",
      "price": 590.00,
      "description": "Balanced amount of fats and carbohydrates provides dogs with energy.",
      "category": "Adult Food",
      "brand": "Araton",
      "imagePath": "assets/images/adult6.jpg",
    },
    

    
    {
      "name": "Veterinary Special Diet",
      "price": 1600.00,
      "description": "Special gluten-free diet for sensitive dogs.",
      "category": "Senior Food",
      "brand": "VetCare",
      "imagePath": "assets/images/dogfood1.webp",
    },
    {
      "name": "Grain-Free Pure Senior Formula",
      "price": 2100.00,
      "description": "Canidae Pure Senior acquires the dominant share of its animal protein from fresh chicken as well as poultry meals.",
      "category": "Senior Food",
      "brand": "Canidae",
      "imagePath": "assets/images/senior1.webp",
    },
    {
      "name": "Grain-Free Fish Recipe",
      "price": 1800.00,
      "description": "This particular food derives the bulk of its protein",
      "category": "Senior Food",
      "brand": "The Honest Kitchen",
      "imagePath": "assets/images/senior2.jpg",
    },
    {
      "name": "Chicken Dinner",
      "price": 2850.00,
      "description": "This wet formula derives most of its animal protein from fresh chicken.",
      "category": "Senior Food",
      "brand": "Senior",
      "imagePath": "assets/images/senior3.webp",
    },
    {
      "name": "Turkey & Chicken Recipe",
      "price": 3450.00,
      "description": "Supporting healthy joints and mobility for aging dogs.",
      "category": "Senior Food",
      "brand": "Open Farm",
      "imagePath": "assets/images/senior4.webp",
    },
    {
      "name": "Protein Rich Nutrition",
      "price": 4350.00,
      "description": "Wellness Core Senior derives the lion’s share of its meat protein from fresh turkey and chicken meal. ",
      "category": "Senior Food",
      "brand": "Wellness",
      "imagePath": "assets/images/senior5.webp",
    },

    

    
    // Add more products here
  ];

  String selectedCategory = "All";
  String searchText = "";
  String? selectedSort;

  List<Map<String, dynamic>> get filteredProducts {
    List<Map<String, dynamic>> filteredByCategory = selectedCategory == "All"
        ? products
        : products.where((product) => product["category"] == selectedCategory).toList();
    
    if (searchText.isNotEmpty) {
      filteredByCategory = filteredByCategory.where((product) {
        final nameLower = product["name"]!.toLowerCase();
        final brandLower = product["brand"]!.toLowerCase();
        final searchLower = searchText.toLowerCase();
        
        return nameLower.contains(searchLower) || brandLower.contains(searchLower);
      }).toList();
    }

    if (selectedSort != null) {
      if (selectedSort == "Price: Low to High") {
        filteredByCategory.sort((a, b) => a["price"].compareTo(b["price"]));
      } else if (selectedSort == "Price: High to Low") {
        filteredByCategory.sort((a, b) => b["price"].compareTo(a["price"]));
      }
    }

    return filteredByCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 60, 93), // AppBar background color
        title: const Text(
          "Product Catalog",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Hamburger menu icon color
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildFilterOptions(),
          _buildSortOptions(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return _buildProductCard(context, filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Search bar widget
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchText = value;
          });
        },
        decoration: InputDecoration(
          hintText: "Search products by name or brand",
          prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 255, 187, 57),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(38),
             borderSide: const BorderSide(color: Color.fromARGB(255, 255, 187, 57), width: 2), // Set yellow border color
          ),
           enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(38),
          borderSide: const BorderSide(color: Color.fromARGB(255, 255, 187, 57), width: 2), // Yellow border for enabled state
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(38),
          borderSide: const BorderSide(color: Color.fromARGB(255, 255, 187, 57), width: 2), // Yellow border for focused state
        ),
      ),
        ),
      );
    
  }

  // Filter buttons for categories
  Widget _buildFilterOptions() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Allows horizontal scrolling
      child: Row(
        children: [
          _buildFilterButton("All"),
          _buildFilterButton("Puppy Food"),
          _buildFilterButton("Adult Food"),
          _buildFilterButton("Senior Food"),
        ],
      ),
      ),
    );
  }

  // Helper function to create a filter button
  Widget _buildFilterButton(String category) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedCategory = category;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedCategory == category
            ? const Color.fromARGB(255, 8, 60, 93) // Active color
            : const Color.fromARGB(255, 255, 187, 57), // Inactive color
           
      ),
      child: Text(category, style: const TextStyle(color: Colors.white)),
    );
  }

  // Sorting options for price
  Widget _buildSortOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            hint: const Text("Sort by"),
            value: selectedSort,
            onChanged: (value) {
              setState(() {
                selectedSort = value;
              });
            },
            items: const [
              DropdownMenuItem(
                value: "Price: Low to High",
                child: Text("Price: Low to High"),
              ),
              DropdownMenuItem(
                value: "Price: High to Low",
                child: Text("Price: High to Low"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Product Card for each item in the catalog
  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(
              itemName: product["name"]!,
              brandName: product["brand"]!,
              itemPrice: product["price"].toString(),
              itemDescription: product["description"]!,
              imagePath: product["imagePath"]!,
              ingredients: "Ingredients details here", // Placeholder
              pros: "Benefits and pros here", // Placeholder
          
            ),
          ),
        );
      },
      child: Card(
        color: const Color.fromARGB(0, 107, 21, 21), // Set the card color to transparent
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          
        ),
        elevation: 14,
        child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 252, 250, 254), // Set the box color to blue
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                            child: Center( // Centers the image
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    product["imagePath"]!,
                    fit: BoxFit.contain, // Keeps aspect ratio without cropping
                    height: 120, // Reduces the image size
                  ),
                ),
              ),
            ),
        
            
    // Center-align product name and price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Centers text vertically
                crossAxisAlignment: CrossAxisAlignment.center, // Aligns text horizontally
                children: [
                  Text(
                    product["name"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 15, 15, 15),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4), // Adds spacing between name and price
                  Text(
                    "Rs.${product["price"]}0",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 15, 15, 15),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
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
}
