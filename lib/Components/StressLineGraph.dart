import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../ModelResponse/OuraApiResponse.dart';
import '../Utilis/theme.dart';

class StressLineGraph extends StatelessWidget {
  final List<OuraApiResponse> StressList;
  final List<LineChartBarData> linesChart;

  StressLineGraph({required this.StressList, required this.linesChart});

  @override
  Widget build(BuildContext context) {
    // List<FlSpot> recoveryHigh = [];
    // List<FlSpot> stressHigh = [];
    //
    // for (int i = 0; i < StressList.length; i++) {
    //   final contributors = StressList[i];
    //   recoveryHigh.add(FlSpot(i.toDouble(), contributors.recoveryHigh!.toDouble()));
    //   stressHigh.add(FlSpot(i.toDouble(), contributors.stressHigh!.toDouble()));
    // }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: width * 0.40,
                    child: LegendItem(color:AppTheme.appBlueColor, text: 'Recovery High')),
                Container(
                    width: width * 0.40,
                    child: LegendItem(color:AppTheme.appRedColor, text: 'Stress High')),
              ],
            ),
            SizedBox(height: 20),
          ]
        ),
        Container(
          height: height / 2,
          child: LineChart(
            LineChartData(
              lineBarsData:linesChart,
              // lineBarsData: [
              //   LineChartBarData(
              //     spots: recoveryHigh,
              //     isCurved: true,
              //     color: Colors.red,
              //     barWidth: 2,
              //     belowBarData: BarAreaData(show: true, color: Colors.red.withOpacity(0.3)),
              //   ),
              //   LineChartBarData(
              //     spots: stressHigh,
              //     isCurved: true,
              //     color: Colors.blue,
              //     barWidth: 2,
              //     belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
              //   ),
              // ],
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final day = value.toInt() + 1;
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 8.0,
                        child: Text(day == 1 ? 'Day $day' : day.toString(),
                            style: TextStyle(color: Colors.black)),
                      );
                    },
                    interval: 1,
                    reservedSize: 40,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 50,
                    getTitlesWidget: (value, meta) {
                      final left = value.toInt();
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 8.0,
                        child: Text(left == 0 ? 'Ratio $left' : left.toString(),
                            style: const TextStyle(fontSize: 10, color: Colors.black)),
                      );
                    },
                    interval: 1000,
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
            ),
          ),
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
