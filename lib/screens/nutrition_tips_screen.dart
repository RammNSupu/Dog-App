import 'package:flutter/material.dart';

class NutritionTipsScreen extends StatelessWidget {
  final List<Map<String, String>> nutritionTips = [
    {
      "title": "Essential Vitamins",
      "description": "Vitamins A, D, and E are essential for health.",
      "details": "Vitamins help with skin health, immunity, and cell function.",
      "imagePath": "assets/images/color1.png",
    },
    {
      "title": "Protein Sources",
      "description": "Include lean meats like chicken and fish.",
      "details": "Proteins aid in muscle growth and provide energy.",
      "imagePath": "assets/images/color2.png",
    },
    {
      "title": "Healthy Carbohydrates",
      "description": "Complex carbs like sweet potatoes are beneficial.",
      "details": "Provide sustained energy and aid in digestion.",
      "imagePath": "assets/images/color1.png",
    },
    {
      "title": "Hydration Importance",
      "description": "Ensure your dog has access to fresh water.",
      "details": "Hydration is crucial for kidney health and energy.",
      "imagePath": "assets/images/color2.png",
    },
  ];

   NutritionTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 60, 93),
        title: const Text("Nutrition Tips" , style: TextStyle(color: Colors.white)),
               
        
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: nutritionTips.length,
        itemBuilder: (context, index) {
          return NutritionTipCard(
            title: nutritionTips[index]["title"]!,
            description: nutritionTips[index]["description"]!,
            details: nutritionTips[index]["details"]!,
            imagePath: nutritionTips[index]["imagePath"]!,
          );
        },
      ),
    );
  }
}

class NutritionTipCard extends StatefulWidget {
  final String title;
  final String description;
  final String details;
  final String imagePath;

  const NutritionTipCard({
    super.key,
    required this.title,
    required this.description,
    required this.details,
    required this.imagePath,
  });

  @override
  _NutritionTipCardState createState() => _NutritionTipCardState();
}

class _NutritionTipCardState extends State<NutritionTipCard> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _iconRotation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconRotation = Tween<double>(begin: 0, end: 0.5).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
            _isExpanded ? _animationController.forward() : _animationController.reverse();
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                widget.imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:  Color.fromARGB(255, 255, 187, 57),
                          ),
                        ),
                      ),
                      RotationTransition(
                        turns: _iconRotation,
                        child: const Icon(
                          Icons.expand_more,
                          color: Color.fromARGB(255, 255, 187, 57),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  if (_isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.details,
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
