import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/utils/scaling_utility.dart';

class UserNotification extends StatelessWidget {
  const UserNotification({super.key});

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
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.white.withOpacity(0.5),
              strokeWidth: scale.getScaledHeight(1), // Scaled stroke width
            ),
            getDrawingVerticalLine: (value) => FlLine(
              color: Colors.white.withOpacity(0.5),
              strokeWidth: scale.getScaledHeight(1), // Scaled stroke width
            ),
            checkToShowHorizontalLine: (value) => value % 20 == 0,
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
                    'Time',
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
                    'M',
                    'X'
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
                FlSpot(1, scale.getScaledHeight(40)),
                FlSpot(1, scale.getScaledHeight(50)),
                FlSpot(1, scale.getScaledHeight(60)),
                FlSpot(1, scale.getScaledHeight(70)),
                FlSpot(1, scale.getScaledHeight(80)),
              ],
              color: Colors.yellow,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(2, scale.getScaledHeight(50)),
                FlSpot(2, scale.getScaledHeight(60)),
                FlSpot(2, scale.getScaledHeight(70)),
                FlSpot(2, scale.getScaledHeight(80)),
                FlSpot(2, scale.getScaledHeight(90)),
                FlSpot(2, scale.getScaledHeight(100)),
              ],
              color: Colors.red,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(3, scale.getScaledHeight(50)),
                FlSpot(3, scale.getScaledHeight(60)),
                FlSpot(3, scale.getScaledHeight(70)),
                FlSpot(3, scale.getScaledHeight(80)),
                FlSpot(3, scale.getScaledHeight(90)),
                FlSpot(3, scale.getScaledHeight(100)),
              ],
              color: Colors.red,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(4, scale.getScaledHeight(20)),
                FlSpot(4, scale.getScaledHeight(30)),
                FlSpot(4, scale.getScaledHeight(40)),
              ],
              color: Colors.green,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(5, scale.getScaledHeight(30)),
                FlSpot(5, scale.getScaledHeight(40)),
                FlSpot(5, scale.getScaledHeight(50)),
                FlSpot(5, scale.getScaledHeight(60)),
              ],
              color: Colors.orange,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(6, scale.getScaledHeight(30)),
                FlSpot(6, scale.getScaledHeight(40)),
                FlSpot(6, scale.getScaledHeight(50)),
                FlSpot(6, scale.getScaledHeight(60)),
              ],
              color: Colors.orange,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(7, scale.getScaledHeight(20)),
                FlSpot(7, scale.getScaledHeight(30)),
                FlSpot(7, scale.getScaledHeight(40)),
              ],
              color: Colors.green,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(8, scale.getScaledHeight(40)),
                FlSpot(8, scale.getScaledHeight(50)),
                FlSpot(8, scale.getScaledHeight(60)),
                FlSpot(8, scale.getScaledHeight(70)),
                FlSpot(8, scale.getScaledHeight(80)),
              ],
              color: Colors.yellow,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(9, scale.getScaledHeight(50)),
                FlSpot(9, scale.getScaledHeight(60)),
                FlSpot(9, scale.getScaledHeight(70)),
                FlSpot(9, scale.getScaledHeight(80)),
                FlSpot(9, scale.getScaledHeight(90)),
                FlSpot(9, scale.getScaledHeight(100)),
              ],
              color: Colors.red,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(10, scale.getScaledHeight(20)),
                FlSpot(10, scale.getScaledHeight(30)),
                FlSpot(10, scale.getScaledHeight(40)),
              ],
              color: Colors.green,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
            LineChartBarData(
              isCurved: false,
              spots: [
                FlSpot(11, scale.getScaledHeight(30)),
                FlSpot(11, scale.getScaledHeight(40)),
                FlSpot(11, scale.getScaledHeight(50)),
                FlSpot(11, scale.getScaledHeight(60)),
              ],
              color: Colors.orange,
              barWidth: scale.getScaledHeight(1), // Thin connecting line
            ),
          ],
          minY: scale.getScaledHeight(0),
          minX: 0,
          maxX: 11.1,
          maxY: scale.getScaledHeight(100), // Adjust based on the maximum value
        ),
      ),
    );
  }
}
