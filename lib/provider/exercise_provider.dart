import 'package:flutter/material.dart';
import 'package:buffmeup_v2/models/exercise_model.dart';
class ExerciseProvider with ChangeNotifier {
  Exercise _exercise = Exercise(
    name: '',
    type: 'Strength',
    targetMuscleGroups: [],
    equipmentRequired: false,
    description: '',
    sets: 1,
    minReps: 1,
    maxReps: 10,
    restTime: 30,
  );

  Exercise get exercise => _exercise;

  void updateExercise(Exercise newExercise) {
    _exercise = newExercise;
    notifyListeners();
  }
}
