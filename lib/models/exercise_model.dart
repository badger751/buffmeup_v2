class Exercise {
  String name;
  String type;
  List<String> targetMuscleGroups;
  bool equipmentRequired;
  String description;
  String? videoUrl;
  String? localVideoPath;
  int sets;
  int minReps;
  int maxReps;
  int restTime;

  Exercise({
    required this.name,
    required this.type,
    required this.targetMuscleGroups,
    required this.equipmentRequired,
    required this.description,
    this.videoUrl,
    this.localVideoPath,
    required this.sets,
    required this.minReps,
    required this.maxReps,
    required this.restTime,
  });
}
