import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AnimatedGradientContainer extends StatelessWidget {
  const AnimatedGradientContainer(
      {super.key, required this.gradientColors, required this.gradientAngle, required this.borderRadius});

  final List<Color> gradientColors;
  final double gradientAngle;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color(0xFF1AAF74).withOpacity(.2),
            borderRadius: borderRadius,
            border: GradientBoxBorder(
                width: 2,
                gradient: SweepGradient(
                    colors: [...gradientColors, ...gradientColors.reversed],
                    stops: _generateColorStops([...gradientColors, ...gradientColors.reversed]),
                    transform: GradientRotation(gradientAngle)))));
  }

  List<double> _generateColorStops(List<dynamic> colors) {
    return colors.asMap().entries.map((entry) {
      double percentageStop = entry.key / colors.length;
      return percentageStop;
    }).toList();
  }
}
