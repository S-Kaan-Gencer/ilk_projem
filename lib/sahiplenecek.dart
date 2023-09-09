import 'package:evcil_hayvan_sahiplendirme/constans/taskType.dart';
import 'package:evcil_hayvan_sahiplendirme/model/task.dart';
import 'package:flutter/material.dart';

  class sahiplenecek extends StatefulWidget {
  const sahiplenecek({super.key, required this.task});
  final Task task;

  @override
  State<sahiplenecek> createState() => _sahiplenecekState();
}

class _sahiplenecekState extends State<sahiplenecek> {
  bool isChecked = false;

  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == taskType.kopek
                ? Image.asset("lib/assets/images/dog kopyası.png")
                : widget.task.type == taskType.kedi
                    ? Image.asset("lib/assets/images/cat.png")
                    : Image.asset("lib/assets/images/duck.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      decoration: widget.task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    widget.task.description,
                    style: TextStyle(
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  )
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(
                  () {
                    widget.task.isCompleted = !widget.task.isCompleted;
                    isChecked = val!;
                  },
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
