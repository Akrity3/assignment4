import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  // Images 
  final List<Map<String, String>> _items = const [
    {"name": "Aakriti",   "image": "assets/images/employee1.jpg"},
    {"name": "Neehangma",     "image": "assets/images/employee2.jpg"},
    {"name": "Hritisha",   "image": "assets/images/employee3.jpg"},
    {"name": "Manish",   "image": "assets/images/employee4.jpg"},
    {"name": "Pawan",    "image": "assets/images/employee5.jpg"},
    {"name": "Hari",   "image": "assets/images/employee6.jpg"},
    {"name": "Sudin",   "image": "assets/images/employee7.jpg"},
    {"name": "Sulav",   "image": "assets/images/employee8.jpg"},
    {"name": "Sujita",    "image": "assets/images/employee9.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
        backgroundColor: const Color(0xFFC8E6C9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: _items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,       
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              imagePath,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Shows if image is missing from assets/images/
                return const CircleAvatar(
                  radius: 35,
                  backgroundColor: Color(0xFFA5D6A7),
                  child: Icon(Icons.person, size: 35, color: Colors.white),
                );},
             ),
          ),
          const SizedBox(height: 8),
          Text(name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF388E3C),
            ),
           ),
        ],
        ),
    );}
}