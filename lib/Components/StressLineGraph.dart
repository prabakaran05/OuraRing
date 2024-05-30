import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ModelResponse/StressResponse.dart';

class Stresslinegraph extends StatelessWidget {
  final List<StressData> StressList;

  Stresslinegraph({super.key, required this.StressList});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spotsStressHigh = [];
    List<FlSpot> spotsStressRecovery = [];

    for (int i = 0; i < StressList.length; i++) {
      final stressData = StressList[i];
      spotsStressHigh.add(FlSpot(i.toDouble(), stressData.stressHigh!.toDouble()));
      spotsStressRecovery.add(FlSpot(i.toDouble(), stressData.recoveryHigh!.toDouble()));
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: height / 2,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: spotsStressHigh,
                  isCurved: true,
                  barWidth: 4,
                  color: Colors.cyan,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.cyan.withOpacity(0.3),
                  ),
                ),
                LineChartBarData(
                  spots: spotsStressRecovery,
                  isCurved: true,
                  barWidth: 4,
                  color: Colors.red,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.red.withOpacity(0.3),
                  ),
                ),
              ],
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final day = value.toInt() + 1;
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 8.0,
                        child: Text('Day $day', style: TextStyle(color: Colors.black)),
                      );
                    },
                    interval: 1,
                    reservedSize: 40,
                  ),
                ),

              ),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LegendItem(color: Colors.cyan, text: 'Stress High'),
            SizedBox(width: 20),
            LegendItem(color: Colors.red, text: 'Stress Recovery'),
          ],
        ),
      ],
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
