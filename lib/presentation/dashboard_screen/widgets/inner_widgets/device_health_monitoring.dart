import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/widgets/custom_pie_chart.dart';

class DeviceHealthMonitoring extends GetWidget {
  const DeviceHealthMonitoring({super.key});

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    return Container(
      color: ColorConstant.color1,
      width: scale.fw,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: scale.getScaledHeight(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _colorAndTextRow('Online Status'.tr, Colors.green),
                    _colorAndTextRow('Offine Status'.tr, Colors.white70),
                    _colorAndTextRow('Issue Status'.tr, Colors.orange),
                  ],
                ),
                const CustomPieChart(
                  percentage: 65,
                  color1: Colors.orange,
                  color2: Colors.green,
                  color3: Colors.white70,
                  radius: 10,
                ),
              ],
            ),
            SizedBox(height: scale.getScaledHeight(15)),
            _buildSliderRow('CPU Usage:'.tr, Colors.red, 80, context),
            SizedBox(height: scale.getScaledHeight(5)),
            _buildSliderRow('Memory Usage:'.tr, Colors.green, 70, context),
          ],
        ),
      ),
    );
  }
}

Widget _buildSliderRow(String label, Color color, double value, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: AppStyle.style1.copyWith(
          fontSize: 9,
          color: Colors.white70,
        ),
      ),
      SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 0), // Set radius to 0 to make it rectangular
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 2),
          thumbColor: ColorConstant.color3, // Thumb color
        ),
        child: Slider(
          max: 100,
          value: value,
          onChanged: (value) {},
          activeColor: color,
        ),
      )
    ],
  );
}

Widget _colorAndTextRow(String label, Color color) {
  return Row(
    children: [
      Icon(
        Icons.circle,
        color: color,
        size: 11,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        label,
        style: AppStyle.style1.copyWith(
          fontSize: 9,
          color: Colors.white70,
        ),
      ),
    ],
  );
}
