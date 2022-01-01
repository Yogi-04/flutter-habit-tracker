import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';

class TaskCompletionRing extends StatelessWidget {
  final double progress;

  const TaskCompletionRing({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTheme = AppTheme.of(context);

    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: RingPainter(
          progress: progress,
          taskCompletedColor: _appTheme.accent,
          taskNotCompletedColor: _appTheme.taskRing,
        ),
      ),
    );
  }
}

@immutable
class RingPainter extends CustomPainter {
  final double progress;
  final Color taskCompletedColor;
  final Color taskNotCompletedColor;

  const RingPainter({
    required this.progress,
    required this.taskCompletedColor,
    required this.taskNotCompletedColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final _isCompleted = progress == 1.0;

    final _strokeWidth = size.width * .07;
    final _center = Offset(size.width * .5, size.height * .5);
    final _radius = _isCompleted ? (size.width) / 2 : (size.width - _strokeWidth) / 2;

    if (!_isCompleted) {
      final _backgroundPaint = Paint()
        ..isAntiAlias = true
        ..strokeWidth = _strokeWidth
        ..color = taskNotCompletedColor
        ..style = PaintingStyle.stroke;

      canvas.drawCircle(_center, _radius, _backgroundPaint);
    }

    final _foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = _strokeWidth
      ..color = taskCompletedColor
      ..style = _isCompleted ? PaintingStyle.fill : PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: _center, radius: _radius),
      -(pi * .5),
      2 * pi * progress,
      false,
      _foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) => oldDelegate.progress != progress;
}
