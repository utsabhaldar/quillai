import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/widgets/container_decoration.dart';
import 'package:quillai/widgets/inner_shadow_painter.dart';

class ShadowBorderCard extends StatelessWidget {
  final Widget? content;
  const ShadowBorderCard({
    super.key,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    return CustomPaint(
      painter: InnerShadowPainter(),
      child: Container(
        decoration: cardDecoration(),
        padding: EdgeInsets.symmetric(
          vertical: scale.getScaledHeight(12),
          horizontal: scale.getScaledHeight(16),
        ),
        child: content,
      ),
    );
  }
}
