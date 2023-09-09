import 'package:evcil_hayvan_sahiplendirme/constans/taskType.dart';

class Task {
  Task({
    required this.type,
    required this.title,
    required this.description,
    required this.isCompleted
  });
  final taskType type;
  final String title;
  final String description;
  bool isCompleted;
}