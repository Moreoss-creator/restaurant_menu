import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Restaurant Menu',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MenuScreen(),
    );
  }
}

// 1. Menu Item Model
class MenuItem {
  final String title;
  final String description;
  final IconData icon;
  final Color cardColor;

  const MenuItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.cardColor,
  });
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // 2. Define (color/icon) for each menu item 
  final List<MenuItem> menuItems = const [
    MenuItem(
      title: 'Vegetable Pizza',
      description: 'Loaded with fresh bell peppers, onions, tomatoes, olives, and mozzarella cheese.',
      icon: Icons.grass,
      cardColor: Colors.teal,
    ),
    MenuItem(
      title: 'Chicken Pizza',
      description: 'Topped with grilled chicken breast slices, BBQ sauce, and melted cheese.',
      icon: Icons.dinner_dining, 
      cardColor: Colors.deepOrange,
    ),
    MenuItem(
      title: 'Cheese Pizza',
      description: 'Classic pizza topped with rich tomato sauce and blend of mozzarella and cheddar.',
      icon: Icons.local_pizza,
      cardColor: Colors.amber,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 34, 200),
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            fontFamily: 'cursive',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return Card(
              // Use the unique color for each card
              color: item.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(16.0),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(item: item),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        // Use the unique icon for each item
                        child: Icon(
                          item.icon,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FoodDetailScreen extends StatelessWidget {
  final MenuItem item;

  const FoodDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: item.cardColor,
        title: Text(item.title, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: item.cardColor.withValues(alpha: 0.2),
                child: Icon(
                  item.icon,
                  size: 70,
                  color: item.cardColor,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              item.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              item.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}