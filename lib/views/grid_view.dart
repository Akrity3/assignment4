import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  final List<Map<String, String>> _items = const [
    {"name": "Aakriti",   "image": "assets/images/employee1.jpg"},
    {"name": "Neehangma", "image": "assets/images/employee2.jpg"},
    {"name": "Hritisha",  "image": "assets/images/employee3.jpg"},
    {"name": "Manish",    "image": "assets/images/employee4.jpg"},
    {"name": "Pawan",     "image": "assets/images/employee5.jpg"},
    {"name": "Hari",      "image": "assets/images/employee6.jpg"},
    {"name": "Sudin",     "image": "assets/images/employee7.jpg"},
    {"name": "Sulav",     "image": "assets/images/employee8.jpg"},
    {"name": "Sujita",    "image": "assets/images/employee9.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
        backgroundColor: Colors.green.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: _items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,        // 3 columns -> 3x3 matrix
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final item = _items[index];
            return _buildGridItem(item["name"]!, item["image"]!);
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(String name, String imagePath) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              imagePath,
              height: 65,
              width: 65,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) { 
                return const CircleAvatar( // Shows person icon if image not found 
                  radius: 32,
                  child: Icon(Icons.person, size: 32),
                );
              },
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(fontSize: 13),
            textAlign: TextAlign.center,
          ),
          ],
      ),);
      }
}