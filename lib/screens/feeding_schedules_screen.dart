import 'package:flutter/material.dart';

class FeedingSchedulesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> feedingSchedules = [
    {
      "time": "8:00 AM",
      "meal": "Breakfast",
      "description": "Start the day with a nutritious meal to fuel your dog's energy.",
      "calories": "300 kcal",
      "protein": "25g",
      "fat": "10g",
      "portionSize": "1 cup",
      "tip": "Add a few slices of apple for fiber and taste.",
    },
    {
      "time": "12:00 PM",
      "meal": "Lunch",
      "description": "A balanced meal to sustain energy through the day.",
      "calories": "350 kcal",
      "protein": "30g",
      "fat": "12g",
      "portionSize": "1.5 cups",
      "tip": "Include lean meats like chicken for extra protein.",
    },
    {
      "time": "5:00 PM",
      "meal": "Snack",
      "description": "A light snack to keep your dog satisfied.",
      "calories": "150 kcal",
      "protein": "10g",
      "fat": "5g",
      "portionSize": "1/2 cup",
      "tip": "Try a carrot stick or dental chew for oral health.",
    },
    {
      "time": "7:00 PM",
      "meal": "Dinner",
      "description": "End the day with a fulfilling high-protein meal.",
      "calories": "400 kcal",
      "protein": "35g",
      "fat": "15g",
      "portionSize": "1.5 cups",
      "tip": "Avoid feeding too close to bedtime for easier digestion.",
    },
  ];

   FeedingSchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 8, 60, 93),
        title: const Text("Feeding Schedules" , style: TextStyle(color: Colors.white)),
      
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: feedingSchedules.length,
        itemBuilder: (context, index) {
          return FeedingScheduleCard(
            time: feedingSchedules[index]["time"],
            meal: feedingSchedules[index]["meal"],
            description: feedingSchedules[index]["description"],
            calories: feedingSchedules[index]["calories"],
            protein: feedingSchedules[index]["protein"],
            fat: feedingSchedules[index]["fat"],
            portionSize: feedingSchedules[index]["portionSize"],
            tip: feedingSchedules[index]["tip"],
          );
        },
      ),
    );
  }
}

class FeedingScheduleCard extends StatelessWidget {
  final String time;
  final String meal;
  final String description;
  final String calories;
  final String protein;
  final String fat;
  final String portionSize;
  final String tip;

  const FeedingScheduleCard({
    super.key,
    required this.time,
    required this.meal,
    required this.description,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.portionSize,
    required this.tip,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Meal Icon, Time, and Name
            Row(
              children: [
                Icon(
                  _getMealIcon(meal),
                  color: _getMealColor(meal),
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    meal,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _getMealColor(meal),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Description
            Text(
              description,
              style: const TextStyle(fontSize: 16, color:  Color.fromARGB(234, 0, 0, 0)),
            ),
            const SizedBox(height: 10),

            // Nutritional Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNutritionInfo("Calories", calories, Colors.redAccent),
                _buildNutritionInfo("Protein", protein, Colors.green),
                _buildNutritionInfo("Fat", fat, Colors.orange),
              ],
            ),
            const SizedBox(height: 10),

            // Portion Size
            Row(
              children: [
                const Icon(Icons.restaurant_menu, color: Colors.blueGrey),
                const SizedBox(width: 8),
                Text(
                  "Portion Size: $portionSize",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Tip
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.lightbulb, color: Color.fromARGB(255, 255, 187, 57)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      tip,
                      style: TextStyle(fontSize: 15, color: Colors.teal[900]),
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

  // Helper method to build nutritional info widget
  Widget _buildNutritionInfo(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.grey[800]),
        ),
      ],
    );
  }

  // Helper methods to get meal icon and color
  IconData _getMealIcon(String meal) {
    switch (meal) {
      case 'Breakfast':
        return Icons.free_breakfast;
      case 'Lunch':
        return Icons.lunch_dining;
      case 'Snack':
        return Icons.emoji_food_beverage;
      case 'Dinner':
        return Icons.dinner_dining;
      default:
        return Icons.fastfood;
    }
  }

  Color _getMealColor(String meal) {
    switch (meal) {
      case 'Breakfast':
        return Colors.orange;
      case 'Lunch':
        return Colors.blue;
      case 'Snack':
        return Colors.green;
      case 'Dinner':
        return Colors.redAccent;
      default:
        return Colors.teal;
    }
  }
}
