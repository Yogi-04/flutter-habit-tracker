import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClickableSvgs extends StatelessWidget {
  final String svgPath;
  final Color? color;
  final double? width;

  const ClickableSvgs({
    Key? key,
    required this.svgPath,
    this.color,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      color: color,
      width: width,
    );
  }
}
