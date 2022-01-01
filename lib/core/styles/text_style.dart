import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  // Used when showing the task name in the main grid
  static const taskName = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    letterSpacing: 0,
  );

  // Large text (for add/edit task pages)
  static const heading = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24,
  );

  // Regular text (for add/edit task pages)
  static const content = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );

  // Small text (for add/edit task pages)
  static const caption = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
}
