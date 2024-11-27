import 'package:flutter/material.dart';

class UserLandingPage extends StatelessWidget {
  const UserLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Placeholder for profile action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Highlights Section
            const Text(
              'Highlights:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'No updates at the moment.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Exercise Routine Section
            const Text(
              'Exercise Routine: MONDAY - CHEST',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('1. Ex-1', style: TextStyle(fontSize: 16)),
            const Text('2. Ex-2', style: TextStyle(fontSize: 16)),
            const Text('3. Ex-3', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Placeholder for start workout action
                },
                child: const Text('Start'),
              ),
            ),
            const SizedBox(height: 24),

            // Diet Routine Section
            const Text(
              'Diet Routine - MONDAY',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('1. 8:30 AM - Breakfast', style: TextStyle(fontSize: 16)),
            const Text('2. 9:30 AM - Snack', style: TextStyle(fontSize: 16)),
            const Text('3. 11:00 AM - Lunch', style: TextStyle(fontSize: 16)),
            const Text('4. 1:30 PM - Dinner', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Placeholder for track diet action
                },
                child: const Text('Track'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
