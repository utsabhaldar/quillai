import 'package:flutter/material.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/widgets/inner_shadow_painter.dart';

class SocialButton extends StatelessWidget {
  final Image image;
  final String text;
  final VoidCallback? onPressed;

  const SocialButton({
    super.key,
    required this.image,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InnerShadowPainter(),
      child: Container(
        decoration: _cardDecoration(),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: SizedBox(
            height: 26,
            width: 26,
            child: image,
          ),
          label: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF5E97E0),
            minimumSize: const Size(double.infinity, 50),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: ColorConstant.color1,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
