import 'package:flutter/material.dart';

// Main Educational Content Screen
class EducationalContentScreen extends StatelessWidget {
  const EducationalContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational Content',style: TextStyle(color: Colors.white)),
         backgroundColor: const Color.fromARGB(255, 8, 60, 93),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Explore Dog Nutrition',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildContentCard(
                context,
                title: 'Articles',
                icon: Icons.article,
                color: const Color.fromARGB(255, 255, 187, 57),
                navigateTo: const ArticleListScreen(),
              ),
              const SizedBox(height: 20),
              _buildContentCard(
                context,
                title: 'Videos',
                icon: Icons.video_collection,
                color: const Color.fromARGB(255, 8, 60, 93),
                navigateTo: const VideoListScreen(),
              ),
              const SizedBox(height: 20),
              _buildContentCard(
                context,
                title: 'Guides',
                icon: Icons.book,
                color: const Color.fromARGB(255, 255, 187, 57),
                navigateTo: const GuideListScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentCard(BuildContext context, {required String title, required IconData icon, required Color color, required Widget navigateTo}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => navigateTo));
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 40),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Article List Screen with Custom Card Design
class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> articles = [
      {'title': 'Understanding Dog Nutrition', 'description': 'Learn the basics of dog nutrition.', 'image': "assets/images/canva1.png"},
      {'title': 'Best Foods for Puppies', 'description': 'What puppies need in their diet.', 'image': "assets/images/canva2.png"},
    ];

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 8, 60, 93),
        title: const Text('Articles',style: TextStyle(color: Colors.white))),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 8,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(articles[index]['image']!, fit: BoxFit.fill, height: 220, width: double.infinity),
                ),
                ListTile(
                  title: Text(articles[index]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(articles[index]['description']!),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 224, 181, 11)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailScreen(
                          title: articles[index]['title']!,
                          content: articles[index]['title'] == 'Understanding Dog Nutrition'
                              ? 'Proper nutrition is essential for your dog’s health. Here’s a breakdown:\n\n'
                                '1. Protein: Essential for muscle development.\n'
                                '2. Fats: Provide energy and support brain health.\n'
                                '3. Carbohydrates: Offer a source of fiber and energy.\n\n'
                                'Choose high-quality ingredients, avoid fillers, and aim for balanced meals!'
                              : 'Detailed content about ${articles[index]['title']}...',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Video List Screen with Custom Card Design
class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> videos = [
      {'title': 'How to Feed Your Dog', 'description': 'A video guide to feeding your dog properly.', 'image': "assets/images/canva6.png"},
      {'title': 'Choosing the Right Dog Food', 'description': 'Tips on selecting the best dog food.', 'image': "assets/images/canva7.png"},
    ];

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 8, 60, 93),
        title: const Text('Videos',style: TextStyle(color: Colors.white))),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(videos[index]['image']!, fit: BoxFit.cover, height: 150, width: double.infinity),
                ),
                ListTile(
                  title: Text(videos[index]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(videos[index]['description']!),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 8, 60, 93)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoDetailScreen(
                          title: videos[index]['title']!,
                          content: videos[index]['title'] == 'How to Feed Your Dog'
                              ? 'Learn the best practices for feeding your dog: \n\n'
                                '1. Portion Control: Follow recommended portion sizes.\n'
                                '2. Nutritional Balance: Ensure meals have protein, fats, and carbs.\n'
                                '3. Feeding Frequency: Feed based on age and activity level.\n\n'
                                'Watch this video to get a full demonstration!'
                              : 'Explore the basics of choosing the right dog food...',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Guide List Screen with Custom Card Design
class GuideListScreen extends StatelessWidget {
  const GuideListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> guides = [
      {'title': 'Complete Guide to Dog Nutrition', 'description': 'Comprehensive information for dog owners.', 'image': "assets/images/canva3.png"},
      {'title': 'Feeding Schedule for Puppies', 'description': 'How often to feed puppies.', 'image': "assets/images/canva5.png"},
    ];

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 8, 60, 93),
        title: const Text('Guides',style: TextStyle(color: Colors.white))),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: guides.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(guides[index]['image']!, fit: BoxFit.cover, height: 200, width: double.infinity),
                ),
                ListTile(
                  title: Text(guides[index]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(guides[index]['description']!),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 8, 60, 93)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GuideDetailScreen(
                          title: guides[index]['title']!,
                          content: guides[index]['title'] == 'Complete Guide to Dog Nutrition'
                              ? 'Learn everything about dog nutrition: \n\n'
                                '1. Nutritional requirements for different breeds.\n'
                                '2. Special diets and feeding schedules.\n'
                                '3. Health benefits and considerations for balanced diets.'
                              : 'Details on feeding schedules and dietary needs for puppies.',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Detail Screens
class ArticleDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const ArticleDetailScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const VideoDetailScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Video Highlights',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. How to select the best dog food brands.\n'
              '2. Understanding the ideal serving sizes.\n'
              '3. Essential nutrients and feeding frequency for different breeds.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class GuideDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const GuideDetailScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Guide Highlights',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. Nutritional requirements for different breeds.\n'
              '2. Special diets and feeding schedules.\n'
              '3. Health benefits and considerations for balanced diets.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
