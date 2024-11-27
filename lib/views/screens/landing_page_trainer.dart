import 'package:flutter/material.dart';

class TrainerLandingScreen extends StatelessWidget {
  final String lastPaymentDate = "2023-10-01"; // Placeholder for last payment date
  final int totalUserCount = 10; // Placeholder for total user count
  final List<Map<String, String>> users = [ // Placeholder user data
    {'name': 'Achintya', 'id': 'M2M, 9498xxxx'},
    {'name': 'Bharat', 'id': 'M2M, 8475xxxx'},
    {'name': 'Charan', 'id': 'M2M, 1234xxxx'},
    // Add more users as needed
  ];

   TrainerLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Welcome, APS!")),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/placeholder.png'),
              child: Text("APS"), // Add a placeholder image if available
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: const Text("Highlights"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Last Payment: $lastPaymentDate"),
                    ),
                    ListTile(
                      title: Text("Total No. of Users: $totalUserCount"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    leading: Text("${index + 1}."),
                    title: Text(user['name'] ?? ""),
                    subtitle: Text(user['id'] ?? ""),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Define the action for "Add New" button
                },
                child: const Text("Add New"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Center(
          child: Text(
            "Landing Page",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
