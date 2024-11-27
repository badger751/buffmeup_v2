import 'package:flutter/material.dart';

class DietPlanScreen extends StatelessWidget {
  final String userName = "APS";

  const DietPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diet Plan - $userName"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search food items...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Food Item List
            Expanded(
              child: ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final item = foodItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        item['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text("Serving Size: ${item['servingSize']}"),
                          Text("Calories: ${item['calories']}"),
                          Text("Protein: ${item['protein']}"),
                          Text("Iron: ${item['iron']}"),
                          Text("Meal Time: ${item['mealTime']}"),
                          Text("Day: ${item['day']}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Save Button
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action to save diet plan goes here
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), backgroundColor: Colors.greenAccent,
              ),
              child: const Text("Save", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample data for food items
final List<Map<String, String>> foodItems = [
  {
    'name': 'Yellow Toor Dal',
    'servingSize': '100gm',
    'calories': '100 calories',
    'protein': '10g protein',
    'iron': '5mg iron',
    'mealTime': '11:00 AM',
    'day': 'Monday',
  },
  {
    'name': 'Brown Rice',
    'servingSize': '100gm',
    'calories': '110 calories',
    'protein': '3g protein',
    'iron': '1mg iron',
    'mealTime': '1:00 PM',
    'day': 'Monday',
  },
  // Add more items here
];
