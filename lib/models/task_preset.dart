import 'package:flutter/cupertino.dart';

@immutable
class TaskPreset {
  final String name;
  final String svgPath;

  const TaskPreset({required this.name, required this.svgPath});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskPreset && other.name == name && other.svgPath == svgPath;
  }

  @override
  int get hashCode => name.hashCode ^ svgPath.hashCode;
}
