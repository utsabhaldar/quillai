import 'dart:math';
import 'package:flutter/material.dart';

class SemiCircularProgressIndicator extends StatelessWidget {
  final double progress;
  final Color color;

  const SemiCircularProgressIndicator(
      {super.key, required this.progress, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(120, 120),
          painter: _SemiCircularPainter(progress, color: color),
        ),
        Text(
          '${(progress * 100).toInt()}%',
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _SemiCircularPainter extends CustomPainter {
  final double progress;
  final Color color;

  _SemiCircularPainter(this.progress, {this.color = Colors.orange});

  @override
  void paint(Canvas canvas, Size size) {
    const int totalSegments = 18;
    const double startAngle = -5 * 3.14 / 4;
    const double sweepAngle = 3.14;
    const double gapAngle = 3.14 / 2;
    const double segmentAngle =
        (sweepAngle - (gapAngle * (totalSegments - 1))) / totalSegments;
    final double radius = size.width / 2.5;

    for (int i = 0; i < totalSegments; i++) {
      final double opacity = (i + 1) / totalSegments;
      final paint = Paint()
        ..color = color.withOpacity(opacity * progress.clamp(0.0, 1.0))
        ..style = PaintingStyle.fill;

      if (i / totalSegments <= progress) {
        final double angle = startAngle + i * (segmentAngle + gapAngle);
        const double rectWidth = 8;
        const double rectHeight = 17;

        final double x = size.center(Offset.zero).dx + radius * cos(angle);
        final double y = size.center(Offset.zero).dy + radius * sin(angle);

        canvas.save();
        canvas.translate(x, y);
        canvas.rotate(angle + 3.14 / 2);
        canvas.drawRect(
          Rect.fromCenter(
              center: Offset.zero, width: rectWidth, height: rectHeight),
          paint,
        );
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
