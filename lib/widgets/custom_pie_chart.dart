import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/utils/scaling_utility.dart';

class CustomPieChart extends StatelessWidget {
  final int percentage, radius;
  final Color color1, color2, color3;

  const CustomPieChart({
    super.key,
    required this.percentage,
    required this.radius,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: scale.getScaledHeight(80),
          height: scale.getScaledHeight(80),
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sections: _buildPieChartSections(
                      percentage, color1, color2, color3, scale),
                  centerSpaceRadius: scale.getScaledHeight(30),
                  sectionsSpace: scale.getScaledHeight(2),
                  startDegreeOffset: 270,
                ),
              ),
              Text(
                "$percentage%",
                style: TextStyle(
                  fontSize: scale.getScaledHeight(11),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _buildPieChartSections(
    int percentage,
    Color color1,
    Color color2,
    Color color3,
    ScalingUtility scale,
  ) {
    return [
      PieChartSectionData(
        value: percentage.toDouble(),
        color: color1,
        radius: scale.getScaledHeight(radius),
        showTitle: false,
      ),
      PieChartSectionData(
        value: (100 - percentage) * 1.2,
        color: color2,
        radius: scale.getScaledHeight(radius),
        showTitle: false,
      ),
      PieChartSectionData(
        value: (100 - percentage) * 0.9,
        color: color3,
        radius: scale.getScaledHeight(radius),
        showTitle: false,
      ),
    ];
  }
}
