import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final String userName = "John Doe"; // Fetch this data from backend or local storage
  final String lastPaymentDate = "Mar 2024";
  final String lastPaymentAmount = "800 Rs";
  final String dueAmount = "1500 Rs";

  // Dummy data for Exercise Plan and Diet Plan
  final List<Map<String, String>> exercises = []; // Populate this list from a data source
  final List<Map<String, String>> meals = [];

 UserDetailScreen({super.key}); // Populate this list from a data source

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to user profile or settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Details Section
            Text(
              userName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),

            // Exercise Plan Section
            SectionHeader(
              title: 'Exercise Plan',
              buttonText: 'Create/Edit',
              onButtonPressed: () {
                // Navigate to Exercise Plan Edit Screen
              },
            ),
            exercises.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = exercises[index];
                      return ListTile(
                        title: Text(exercise['name'] ?? 'Exercise Name'),
                        subtitle: Text(
                            'Sets: ${exercise['sets']} | Reps: ${exercise['reps']}'),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No exercises added yet.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
            const SizedBox(height: 20),

            // Diet Plan Section
            SectionHeader(
              title: 'Diet Plan',
              buttonText: 'Create/Edit',
              onButtonPressed: () {
                // Navigate to Diet Plan Edit Screen
              },
            ),
            meals.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      return ListTile(
                        title: Text(meal['mealType'] ?? 'Meal Type'),
                        subtitle: Text(
                            '${meal['time'] ?? 'Time'} - ${meal['description'] ?? 'Meal Description'}'),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No meals added yet.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
            const SizedBox(height: 20),

            // Payment Details Section
            Text(
              'Payment Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.payment, color: Colors.green),
              title: Text('Last Payment: $lastPaymentDate'),
              subtitle: Text('Amount: $lastPaymentAmount'),
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet, color: Colors.red),
              title: Text('Due: $dueAmount'),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const SectionHeader({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
