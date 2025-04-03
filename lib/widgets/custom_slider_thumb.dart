import 'package:flutter/material.dart';

class CustomRoundSliderThumbShape extends RoundSliderThumbShape {
  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color = const Color(0xFF1A3C4F) // Dark blue color for the thumb
      ..style = PaintingStyle.fill;

    // Draw the circular thumb
    canvas.drawCircle(center, 8.0, paint); // Thumb radius of 8
  }
}
