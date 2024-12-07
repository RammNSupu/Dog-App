import 'package:app_for_pet/screens/ItemDetailsScreen.dart';
import 'package:app_for_pet/screens/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItemsScreen extends StatelessWidget {
  final String categoryName;

  CategoryItemsScreen({super.key, required this.categoryName, required String category});

  // Define items for each category with additional fields
  final Map<String, List<Map<String, String>>> categoryItems = {
    'Puppy Food': [
      {
        'name': 'Puppy Milk Flavor Food',
        'brandName': 'Puppy ',
        'price': 'Rs.770.00',
        'description': 'Nutritious milk flavor food for puppies.',
        'imagePath': 'assets/images/dogfood4.webp',
        'ingredients': 'Milk, Chicken Meal, Vitamins, Minerals',
        'pros': 'Promotes healthy bones, Supports growth, Easily digestible',
       
    
      },
      {
        'name': 'Chicken Chunk in Gravy',
        'brandName': 'Gravy Lovers',
        'price': 'Rs.310.00',
        'description': 'Tender chicken chunks in gravy for puppies.',
        'imagePath': 'assets/images/dogfood1.webp',
        'ingredients': 'Chicken, Gravy, Protein',
        'pros': 'High in protein, Great flavor, Suitable for young puppies',
      },
      {
        'name': 'Milk flavor food',
        'brandName': 'Classic Pets',
        'price': 'Rs.700.00',
        'description': 'Nutritious milk flavor food for puppies.',
        'imagePath': 'assets/images/newiteme1.jpg',
        'ingredients': 'Corn, rice, soybean meal',
        'pros': 'Nervous System Enhancement ',
      },
      {
        'name': 'Healthy Growth',
        'brandName': 'Purina',
        'price': 'Rs.9000.00',
        'description': 'Healthy Growth and Development puppy food contains a unique blend of live probiotic',
        'imagePath': 'assets/images/newitem2.jpg',
        'ingredients': 'Chicken meal, brewers rice, oats,  animal fat ',
        'pros': 'Gut health, Brain and vision support, Healthy coat, Strong teeth and bones   ',
      },
      {
        'name': 'Chicken, Egg & Milk',
        'brandName': 'SmartHeart',
        'price': 'Rs.860.00',
        'description': 'Growing puppies generally need a diet having a balanced nutrition for making themselves stronger and healthier.',
        'imagePath': 'assets/images/newitem4.jpg',
        'ingredients': 'Rice, Poultry meal, Soybean meal, Chicken Oil, Beet Pulp, Flax Seed,',
        'pros': 'High-quality ingredients for enhancing the palatability.',
      },
      {
        'name': 'Josera Kids',
        'brandName': 'Josera',
        'price': 'Rs.2600.00',
        'description': 'Puppy food For our young Dog who want to reach the stars: a special growth formula for medium and large breeds.',
        'imagePath': 'assets/images/newitem5.jpg',
        'ingredients': ' whole grain corn, rice, beet fibre, poultry fat ',
        'pros': 'Suitable for heavily-built dogs, Can be fed all the way through to adulthood. ',
      },
      {
        'name': 'Fit & Vital Mini Puppy',
        'brandName': 'Happy Dog',
        'price': 'Rs.2500.00',
        'description': 'specially balanced complete dog food for puppies from the first month.',
        'imagePath': 'assets/images/newitem6.jpg',
        'ingredients': 'salmon meal, potato protein, sunflower oil',
        'pros': 'Small chroquettes, Easily digestible',
      },
      
      {
        'name': 'Sensible Mini Puppy',
        'brandName': 'Happy Dog',
        'price': 'Rs.1900.00',
        'description': 'Easily tolerated complete feed with lamb & rice for puppies and juniors from 4 weeks through to 12 months',
        'imagePath': 'assets/images/newitem7.jpg',
        'ingredients': 'Lamb protein, apple pomace, hydrolysed protein ',
        'pros': 'Poultry-free & wheat-free recipe, Especially easy to digest, No additives  ',
      },
      // Add more Puppy Food items here
    ],
    'Adult Food': [
      {
        'name': 'Adult Dog Meat & Rice',
        'brandName': 'Adult Feast',
        'price': 'Rs.1950.00',
        'description': 'Healthy chicken meal for adult dogs.',
        'imagePath': 'assets/images/dogfood2.webp',
        'ingredients': 'Chicken, Rice, Vegetables',
        'pros': 'Balanced nutrition, Great for active dogs',
      },
      {
        'name': ' Adult Dog Chicken & Egg',
        'brandName': 'Drools',
        'price': 'Rs.740.00',
        'description': 'Offers a complete and balanced nutritional diet to your pet.',
        'imagePath': 'assets/images/adult1.jpg',
        'ingredients': 'Real chicken ',
        'pros': 'maintain strong bones and healthy digestive system.',
      },
      {
        'name': 'Josi Dog Active 900g',
        'brandName': 'Happy Pet',
        'price': 'Rs.1700.00',
        'description': ' an energy packed dog food for adult active dogs.',
        'imagePath': 'assets/images/adult2.jpg',
        'ingredients': ' dry food, animal protein ',
        'pros': 'Complete food for adult active dogs, Energy packed recipe with more vitality ',
      },
      {
        'name': 'Adult Dog Meat & Rice',
        'brandName': 'Pedigree',
        'price': 'Rs.1950.00',
        'description': 'Meat & Rice is a healthy and complete meal for your adult dog.',
        'imagePath': 'assets/images/adult3.jpg',
        'ingredients': 'Chicken,  Vegetable oils, Vegetables',
        'pros': 'Proven healthier & shinier coat, Strong muscles, Digestive health ',
      },
      {
        'name': 'Josi Dog Wet Food',
        'brandName': 'Happy Pet',
        'price': 'Rs.950.00',
        'description': 'high-quality, balanced meal for dogs, designed to meet their nutritional needs at every life stage.',
        'imagePath': 'assets/images/adult4.jpg',
        'ingredients': 'Rice, Chicken broth, Sunflower oil, Vitamins and minerals ',
        'pros': 'Nutritionally Complete, Highly Digestible ',
      },
      {
        'name': 'Sensitive Skin & Stomach',
        'brandName': 'Purina',
        'price': 'Rs.6750.00',
        'description': ' Sensitive Skin and Stomach reduces the risk of these nasty tummy and skin reactions to food.',
        'imagePath': 'assets/images/adult5.jpg',
        'ingredients': 'Chicken, Beef, Soy, Corn, Wheat',
        'pros': 'Easy nutrient absorption, Happier digestion',
      },
      {
        'name': ' Dog Dry Food',
        'brandName': 'Araton',
        'price': 'Rs.590.00',
        'description': 'Balanced amount of fats and carbohydrates provides dogs with energy.',
        'imagePath': 'assets/images/adult6.jpg',
        'ingredients': 'Chicken meal, Corn, Wheat, Poultry fat, Fish meal',
        'pros': 'Energy Boosting, High Protein Content',
      },
      
      // Add more Adult Food items here
    ],
    'Snack & Treats': [
      {
        'name': 'Dog Biscuits 200g',
        'brandName': 'Tasty Treats',
        'price': 'Rs.580.00',
        'description': 'Low-calorie treats for senior dogs.',
        'imagePath': 'assets/images/dogfood3.webp',
        'ingredients': 'Whole grains, Chicken fat, Carrot',
        'pros': 'Low calorie, Good for teeth health',
      },
        {
        'name': 'Twists Rawhide Treats',
        'brandName': 'Seepet',
        'price': 'Rs.350.00',
        'description': 'A natural protein supplement for healthy gums and teeth.',
        'imagePath': 'assets/images/snack1.jpg',
        'ingredients': '100% natural rawhide, No artificial flavors or preservatives',
        'pros': 'Promotes Dental Health, ong-Lasting Chew, All-Natural  ',
      },
        {
        'name': 'Dog Natural Munchies',
        'brandName': 'Seepet',
        'price': 'Rs..480',
        'description': 'Can be fed anytime as a reward.',
        'imagePath': 'assets/images/snack2.jpg',
        'ingredients': 'Natural rawhide, Starch, Ghee, Tapioca',
        'pros': '100% natural, For healthy gums & teeth, Improve digestion and muscle mass  ',
      },
        {
        'name': 'Woofbix Dog Biscuits',
        'brandName': 'Ariyence',
        'price': 'Rs.580.00',
        'description': 'may feed at any time as a supplementary pet treat to your dog.',
        'imagePath': 'assets/images/snack3.jpg',
        'ingredients': 'Red Rice, Green gram, Wheat flour, Milk powder, Chicken ',
        'pros': 'Rich in Calcium, Crunchy Texture ',
      },
        {
        'name': 'Chicken Liver Dog Treats',
        'brandName': 'Happy Pup',
        'price': 'Rs.650.00',
        'description': '100% Natural Homemade Dog Treats.',
        'imagePath': 'assets/images/snack4.jpg',
        'ingredients': 'Whole wheat flour, chicken liver & eggs',
        'pros': 'Irresistible Flavor, Soft and Chewy',
      },
        {
        'name': 'Dehydrated Chicken Feet ',
        'brandName': 'Canis',
        'price': 'Rs.700.00',
        'description': 'This product has been gently dried to ensure that the nutritional value.',
        'imagePath': 'assets/images/snack5.jpg',
        'ingredients': '100% dehydrated chicken feet',
        'pros': 'Natural and Nutritious, Dental Benefits',
      },
      // Add more Snack & Treats items here
    ],
    'Special Diets': [
      {
        'name': 'Veterinary Special Diet',
        'brandName': 'VetCare',
        'price': 'Rs.1800.00',
        'description': 'Special gluten-free diet for sensitive dogs.',
        'imagePath': 'assets/images/dogfood1.webp',
        'ingredients': 'Salmon, Potato, Omega-3',
        'pros': 'Good for kidney health, Gluten-free, Supports metabolism',
      },
      {
        'name': 'Sensitive Tummy Chicken',
        'brandName': 'Bakers',
        'price': 'Rs.2400.00',
        'description': 'With Natural Spirulina Algae, known for its beneficial impact on intestinal health',
        'imagePath': 'assets/images/diets1.jpg',
        'ingredients': 'Oils and fats, Vegetables, Meat and animal derivatives ',
        'pros': '100% Complete, Made with Selected Natural Ingredients',
      },
      {
        'name': 'Grain Free Turkey ',
        'brandName': 'ProPlan',
        'price': 'Rs.9000.00',
        'description': 'With prebiotics proven to help promote a better gut microflora balance.',
        'imagePath': 'assets/images/diets2.jpg',
        'ingredients': 'High quality turkey, Dried chicken protein, Dried cassava, Pea starch',
        'pros': 'Turkey as No1 ingredient & High protein ',
      },
      {
        'name': 'Gastrointestinal Dry Food',
        'brandName': 'ProPlan',
        'price': 'Rs.10,000.00',
        'description': 'Highly digestible ingredients to help promote high nutrient absorption and reduce workload on the compromised gut.',
        'imagePath': 'assets/images/diets3.jpg',
        'ingredients': 'Rice, Corn, Pea protein, Digest',
        'pros': 'Low fat. Help minimise fat maldigestion.  ',
      },
      {
        'name': 'Meaty Chunks Mixed',
        'brandName': 'Winalot',
        'price': 'Rs.1600.00',
        'description': '100% complete and balanced.',
        'imagePath': 'assets/images/diets4.jpg',
        'ingredients': 'Beef, Chicken, Potato',
        'pros': 'No added artificial colours, flavours or preservatives.',
      },
      // Add more Special Diet items here
    ],
  };

  @override
  Widget build(BuildContext context) {
    final items = categoryItems[categoryName] ?? []; // Get items for the selected category

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 8, 60, 93),
        title: Text('$categoryName Items',style: const TextStyle(color: Colors.white))),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailScreen(
                    itemName: item['name']!,
                    brandName: item['brandName']!,
                    itemPrice: item['price']!,
                    itemDescription: item['description']!,
                    imagePath: item['imagePath']!,
                    ingredients: item['ingredients']!,
                    pros: item['pros']!,
                    
                    
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    item['imagePath']!,
                    height: 63,
                  ),
                  const SizedBox(height: 10),
                  Text(item['name']!, style: const  TextStyle(fontWeight: FontWeight.bold)),
                  Text(item['price']!, style: const TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0))),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart functionality
                       Provider.of<CartProvider>(context, listen: false).addToCart({
                        'name': item['name']!,
                        'brand': item['brandName']!,
                        'price': item['price']!,
                        'imagePath': item['imagePath']!,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart')),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 187,57)),
                    child:  const Text('Add to Cart',
                     style: TextStyle(color:  Color.fromARGB(255, 8, 60, 93))),






                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
