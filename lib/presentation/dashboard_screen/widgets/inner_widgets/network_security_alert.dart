import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/utils/scaling_utility.dart';

class NetworkSecurityAlert extends StatelessWidget {
  const NetworkSecurityAlert({super.key});

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    return Container(
      color: ColorConstant.color1,
      height: scale.getScaledHeight(130), // Scaled height
      width: scale.fw,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.white.withOpacity(0.5),
              strokeWidth: scale.getScaledHeight(1), // Scaled stroke width
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: scale.getScaledHeight(25), // Scaled reserved size
                interval: 20,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: scale.getScaledHeight(7), // Scaled font size
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1, // Interval for labels
                getTitlesWidget: (value, meta) {
                  const labels = [
                    'D1',
                    'D2',
                    'D3',
                    'D4',
                    'D5',
                    'D6',
                    'D7',
                    'W1',
                    'W2',
                    'W3',
                    'M'
                  ];
                  return Text(
                    labels[value.toInt() % labels.length],
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: scale.getScaledHeight(7), // Scaled font size
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(
                color: Colors.grey,
              ),
              bottom: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(0, scale.getScaledHeight(10)),
                FlSpot(1, scale.getScaledHeight(20)),
                FlSpot(2, scale.getScaledHeight(40)),
                FlSpot(3, scale.getScaledHeight(60)),
                FlSpot(4, scale.getScaledHeight(70)),
                FlSpot(5, scale.getScaledHeight(80)),
                FlSpot(6, scale.getScaledHeight(60)),
                FlSpot(7, scale.getScaledHeight(85)),
                FlSpot(8, scale.getScaledHeight(90)),
                FlSpot(9, scale.getScaledHeight(85)),
                FlSpot(10, scale.getScaledHeight(70)),
              ],
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  // Customize the colors of the dots based on index or position
                  Color dotColor;
                  if (spot.y >= 70) {
                    dotColor = Colors.red;
                  } else if (spot.y >= 50) {
                    dotColor = Colors.orange;
                  } else {
                    dotColor = Colors.green;
                  }
                  return FlDotCirclePainter(
                    radius: scale.getScaledHeight(3), // Adjust circle size
                    color: dotColor,
                    strokeWidth: 0,
                  );
                },
              ),
              color: Colors.white70,
              barWidth: scale.getScaledHeight(1), // Scaled bar width
            ),
          ],
          minY: scale.getScaledHeight(0),
          maxY: scale.getScaledHeight(80),
        ),
      ),
    );
  }
}
