import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit_tracker/models/task_preset.dart';
import 'package:habit_tracker/shared/task/task_with_name.dart';

class TasksGrid extends StatelessWidget {
  final List<TaskPreset> tasks;

  const TasksGrid({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final _crossAxisSpacing = constraints.maxWidth * .05;
        final _taskWidth = (constraints.maxWidth - _crossAxisSpacing) * .5;
        const _aspectRatio = .8;
        final _taskHeight = _taskWidth / _aspectRatio;
        final _mainAxisSpacing = (constraints.maxHeight - _taskHeight * 3) / 3.0;

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: _crossAxisSpacing,
            mainAxisSpacing: _mainAxisSpacing,
            childAspectRatio: _aspectRatio,
          ),
          itemBuilder: (context, index) => TaskWithName(taskPreset: tasks[index]),
          itemCount: tasks.length,
        );
      },
    );
  }
}
