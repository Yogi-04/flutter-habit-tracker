import 'package:flutter/material.dart';
import '../../core/styles/text_style.dart';
import '../../core/theme/theme.dart';
import '../../models/task_preset.dart';
import 'animates_task.dart';

class TaskWithName extends StatelessWidget {
  final TaskPreset taskPreset;

  const TaskWithName({Key? key, required this.taskPreset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedTask(icon: taskPreset.svgPath),
        const SizedBox(height: 8.0),
        Text(
          taskPreset.name.toUpperCase(),
          textAlign: TextAlign.center,
          style: AppTextStyle.taskName.copyWith(
            color: AppTheme.of(context).accent,
          ),
        ),
      ],
    );
  }
}
