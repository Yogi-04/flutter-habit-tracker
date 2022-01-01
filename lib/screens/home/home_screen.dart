import 'package:flutter/material.dart';
import 'package:habit_tracker/core/size_config.dart';
import 'package:habit_tracker/screens/home/widgets/task_grid.dart';

import '../../core/resources/svgs.dart';
import '../../core/theme/theme.dart';
import '../../models/task_preset.dart';
import '../../shared/task/task_with_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primary,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: TasksGrid(tasks: kTasks),
      ),
    );
  }
}

const kTasks = <TaskPreset>[
  TaskPreset(name: 'Eat Healthy', svgPath: AppSvgs.chef),
  TaskPreset(name: 'Walk the Dog', svgPath: AppSvgs.dog),
  TaskPreset(name: 'Do some Coding', svgPath: AppSvgs.html),
  TaskPreset(name: 'Meditate', svgPath: AppSvgs.meditation),
  TaskPreset(name: 'Do 40 Pushups', svgPath: AppSvgs.pushups),
  TaskPreset(name: 'Sleep 7:30 hours', svgPath: AppSvgs.rest),
];
