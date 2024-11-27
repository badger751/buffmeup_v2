import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const ExerciseRoutineApp());
}

class ExerciseRoutineApp extends StatelessWidget {
  const ExerciseRoutineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExerciseRoutinePage(),
    );
  }
}

class ExerciseRoutinePage extends StatefulWidget {
  const ExerciseRoutinePage({super.key});

  @override
  _ExerciseRoutinePageState createState() => _ExerciseRoutinePageState();
}

class _ExerciseRoutinePageState extends State<ExerciseRoutinePage> {
  late VideoPlayerController _videoController;
  List<ExerciseSet> sets = [
    ExerciseSet(setNumber: 1),
    ExerciseSet(setNumber: 2),
    ExerciseSet(setNumber: 3),
  ];

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(
      'https://www.example.com/video.mp4',
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Incline Smith Press")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ExerciseHeader(videoController: _videoController),
            Expanded(
              child: ListView.builder(
                itemCount: sets.length,
                itemBuilder: (context, index) {
                  return ExerciseDetailsCard(set: sets[index]);
                },
              ),
            ),
            NavigationButtons(
              onBack: () {
                Navigator.pop(context);
              },
              onNext: () {
                // Navigate to the next screen
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Header widget for title and video player
class ExerciseHeader extends StatelessWidget {
  final VideoPlayerController videoController;

  const ExerciseHeader({super.key, required this.videoController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Incline Smith Press",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: videoController.value.aspectRatio,
          child: VideoPlayer(videoController),
        ),
      ],
    );
  }
}

// Card widget for each set's exercise details
class ExerciseDetailsCard extends StatelessWidget {
  final ExerciseSet set;

  const ExerciseDetailsCard({super.key, required this.set});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Set ${set.setNumber}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(labelText: "Weight (kg)"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                set.weight = double.tryParse(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Repetitions"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                set.repetitions = int.tryParse(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Notes/Objective"),
              onChanged: (value) {
                set.notes = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Navigation buttons for going back and next
class NavigationButtons extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;

  const NavigationButtons({super.key, required this.onBack, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: onBack,
          child: const Text("Back"),
        ),
        ElevatedButton(
          onPressed: onNext,
          child: const Text("Next"),
        ),
      ],
    );
  }
}

// Model for holding each set's data
class ExerciseSet {
  final int setNumber;
  double? weight;
  int? repetitions;
  String? notes;

  ExerciseSet({required this.setNumber});
}
