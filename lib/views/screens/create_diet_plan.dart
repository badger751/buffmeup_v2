import 'package:flutter/material.dart';

class DietPlanScreen extends StatelessWidget {
  const DietPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet Plan'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileSection(),
            SizedBox(height: 20),
            MealPlannerSection(),
            SizedBox(height: 20),
            CustomizationOptionsSection(),
            SizedBox(height: 20),
            ProgressTrackingSection(),
          ],
        ),
      ),
    );
  }
}

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("User Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const TextField(decoration: InputDecoration(labelText: "Name")),
            const TextField(decoration: InputDecoration(labelText: "Age")),
            const TextField(decoration: InputDecoration(labelText: "Weight (kg)")),
            const TextField(decoration: InputDecoration(labelText: "Height (cm)")),
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: "Activity Level"),
              items: ['Low', 'Medium', 'High'].map((level) => DropdownMenuItem(
                value: level,
                child: Text(level),
              )).toList(),
              onChanged: (value) {},
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Dietary Restrictions / Allergies"),
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: "Health Goals"),
              items: ['Weight Loss', 'Weight Gain', 'Muscle Gain', 'Maintenance']
                  .map((goal) => DropdownMenuItem(
                        value: goal,
                        child: Text(goal),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class MealPlannerSection extends StatelessWidget {
  const MealPlannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Meal Planner", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Calorie and Macronutrient Goals: 2000 kcal (Protein: 100g, Carbs: 250g, Fats: 70g)"),
            TextField(
              decoration: InputDecoration(
                labelText: "Food/Recipe Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),
            MealSlotWidget("Breakfast"),
            MealSlotWidget("Lunch"),
            MealSlotWidget("Dinner"),
            MealSlotWidget("Snacks"),
          ],
        ),
      ),
    );
  }
}

class MealSlotWidget extends StatelessWidget {
  final String mealType;
  const MealSlotWidget(this.mealType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(mealType, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Portion Size: 200g"),
            Text("Calories: 500 kcal"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Protein: 20g"),
            Text("Carbs: 50g"),
            Text("Fats: 10g"),
          ],
        ),
      ],
    );
  }
}

class CustomizationOptionsSection extends StatelessWidget {
  const CustomizationOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Customization Options", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(labelText: "Meal Frequency (times per day)"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Meal Timing"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Add Custom Recipe"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressTrackingSection extends StatelessWidget {
  const ProgressTrackingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Progress Tracking", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Weight Tracker: (Graph Placeholder)"),
            Text("Calorie Intake Tracker: (Graph Placeholder)"),
            TextField(
              decoration: InputDecoration(labelText: "Progress Notes"),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
