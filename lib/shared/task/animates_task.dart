import 'package:flutter/material.dart';
import 'package:habit_tracker/core/size_config.dart';

import '../../core/resources/svgs.dart';
import '../../core/theme/theme.dart';
import '../clickable_svgs.dart';
import 'task_completion_ring.dart';

class AnimatedTask extends StatefulWidget {
  final String icon;

  const AnimatedTask({Key? key, required this.icon}) : super(key: key);

  @override
  _AnimatedTaskState createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _curveAnimation;
  final showCheckIconNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _curveAnimation = _animationController.drive(CurveTween(curve: Curves.easeInOut));

    _animationController.addStatusListener(_handleStatusListener);
  }

  void _handleTapCancel() {
    if (_animationController.status == AnimationStatus.completed) return;
    _animationController.reverse();
  }

  void _handleTapDown(TapDownDetails details) {
    if (_animationController.status == AnimationStatus.completed && !showCheckIconNotifier.value) {
      _animationController.reset();
    }
    _animationController.forward();
  }

  void _handleStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      showCheckIconNotifier.value = true;
      Future.delayed(const Duration(seconds: 1), () {
        showCheckIconNotifier.value = false;
      });
    }
  }

  @override
  void setState(VoidCallback fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  @override
  void dispose() {
    _animationController
      ..dispose()
      ..removeStatusListener(_handleStatusListener);
    showCheckIconNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = AppTheme.of(context);

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: (_) => _handleTapCancel(),
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _curveAnimation,
        builder: (context, child) {
          final _iconColor = _curveAnimation.isCompleted ? _theme.accentNegative : _theme.taskIcon;

          return Stack(
            alignment: Alignment.center,
            children: [
              TaskCompletionRing(progress: _curveAnimation.value),
              ValueListenableBuilder<bool>(
                valueListenable: showCheckIconNotifier,
                builder: (context, showCheckIcon, child) => FractionallySizedBox(
                  widthFactor: .5,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClickableSvgs(
                      svgPath: showCheckIcon ? AppSvgs.check : widget.icon,
                      color: _iconColor,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
