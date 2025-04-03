import 'package:flutter/material.dart';
import 'package:quillai/constants/color_constants.dart';

class CustomSlider extends StatelessWidget {
  final Color color;
  final double value;

  const CustomSlider({super.key, required this.color, required this.value});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: const RectangularSliderThumbShape(
          width: 4.0,
          height: 12.0,
        ),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
        thumbColor: ColorConstant.color3,
        activeTrackColor: color,
      ),
      child: Slider(
        max: 100,
        value: value,
        onChanged: (value) {},
      ),
    );
  }
}

class RectangularSliderThumbShape extends SliderComponentShape {
  final double width;
  final double height;

  const RectangularSliderThumbShape({this.width = 12.0, this.height = 20.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(width, height);
  }

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
      ..color = sliderTheme.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    final Rect thumbRect = Rect.fromCenter(
      center: center,
      width: width,
      height: height,
    );

    canvas.drawRect(thumbRect, paint);
  }
}
