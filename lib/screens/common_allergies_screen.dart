import 'package:flutter/material.dart';

class CommonAllergiesScreen extends StatelessWidget {
  final List<Map<String, String>> allergies = [
    {
      "name": "Food Allergy",
      "symptoms": "Itching, red skin, hair loss, digestive issues.",
      "causes": "Common allergens include beef, dairy, wheat, and chicken.",
      "management": "Switch to hypoallergenic food. Consult a vet for dietary tests.",
    },
    {
      "name": "Environmental Allergy",
      "symptoms": "Sneezing, itchy paws, watery eyes.",
      "causes": "Pollen, dust, mold, and grasses.",
      "management": "Limit outdoor exposure during allergy seasons. Clean paws after walks.",
    },
    {
      "name": "Flea Allergy",
      "symptoms": "Severe itching, skin redness, sores, hair loss.",
      "causes": "Reaction to flea saliva.",
      "management": "Use flea prevention treatments. Clean living spaces regularly.",
    },
    {
      "name": "Contact Allergy",
      "symptoms": "Red skin, itching, localized swelling.",
      "causes": "Soaps, shampoos, certain plants, chemicals.",
      "management": "Identify and avoid contact allergens. Use gentle dog-safe products.",
    },
  ];

   CommonAllergiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Common Allergies", style: TextStyle(color: Colors.white)),
         backgroundColor: const Color.fromARGB(255, 8, 60, 93),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: allergies.length,
        itemBuilder: (context, index) {
          return AllergyCard(
            name: allergies[index]["name"]!,
            symptoms: allergies[index]["symptoms"]!,
            causes: allergies[index]["causes"]!,
            management: allergies[index]["management"]!,
          );
        },
      ),
    );
  }
}

class AllergyCard extends StatefulWidget {
  final String name;
  final String symptoms;
  final String causes;
  final String management;

  const AllergyCard({
    super.key,
    required this.name,
    required this.symptoms,
    required this.causes,
    required this.management,
  });

  @override
  _AllergyCardState createState() => _AllergyCardState();
}

class _AllergyCardState extends State<AllergyCard> with SingleTickerProviderStateMixin {
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
      elevation: 4,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _getAllergyIcon(widget.name),
                    color: _getAllergyColor(widget.name),
                    size: 35,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _getAllergyColor(widget.name),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: _iconRotation,
                    child: const Icon(
                      Icons.expand_more,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Symptoms: ${widget.symptoms}",
                style: TextStyle(fontSize: 15, color: Colors.grey[700]),
              ),
              if (_isExpanded) ...[
                const SizedBox(height: 10),
                Text(
                  "Causes: ${widget.causes}",
                  style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.lightbulb, color: Colors.teal),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Management Tip: ${widget.management}",
                          style: TextStyle(fontSize: 15, color: Colors.teal[900]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to get relevant icon for each allergy type
  IconData _getAllergyIcon(String name) {
    switch (name) {
      case 'Food Allergy':
        return Icons.restaurant;
      case 'Environmental Allergy':
        return Icons.eco;
      case 'Flea Allergy':
        return Icons.bug_report;
      case 'Contact Allergy':
        return Icons.sanitizer;
      default:
        return Icons.info;
    }
  }

  // Helper function to get color based on allergy type
  Color _getAllergyColor(String name) {
    switch (name) {
      case 'Food Allergy':
        return Colors.orange;
      case 'Environmental Allergy':
        return Colors.blue;
      case 'Flea Allergy':
        return Colors.redAccent;
      case 'Contact Allergy':
        return Colors.green;
      default:
        return Colors.teal;
    }
  }
}
