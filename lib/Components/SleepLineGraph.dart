import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../ModelResponse/OuraApiResponse.dart';
import '../Utilis/theme.dart';

class Sleeplinegraph extends StatelessWidget {
  final List<OuraApiResponse> StressList;
  final List<LineChartBarData> linesChart;

  Sleeplinegraph({super.key, required this.StressList, required this.linesChart});

  @override
  Widget build(BuildContext context) {

    // List<FlSpot> deepSleep = [];
    // List<FlSpot> efficiency = [];
    // List<FlSpot> latency = [];
    // List<FlSpot> remSleep = [];
    // List<FlSpot> restfulness = [];
    // List<FlSpot> timing = [];
    // List<FlSpot> totalSleep = [];
    //
    // for (int i = 0; i < StressList.length; i++) {
    //   final contributors = StressList[i];
    //   deepSleep.add(FlSpot(i.toDouble(), contributors.deepSleep!.toDouble()));
    //   efficiency.add(FlSpot(i.toDouble(), contributors.efficiency!.toDouble()));
    //   latency.add(FlSpot(i.toDouble(), contributors.latency!.toDouble()));
    //   remSleep.add(FlSpot(i.toDouble(), contributors.remSleep!.toDouble()));
    //   restfulness.add(FlSpot(i.toDouble(), contributors.restfulness!.toDouble()));
    //   timing.add(FlSpot(i.toDouble(), contributors.timing!.toDouble()));
    //   totalSleep.add(FlSpot(i.toDouble(), contributors.totalSleep!.toDouble()));
    // }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: width * 0.40,
                    child: LegendItem(color:AppTheme.appBlueColor, text: 'Deep Sleep')),
                Container(
                    width: width * 0.40,
                    child: LegendItem(color:AppTheme.appgreenColor, text: 'Efficiency')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: width * 0.40,
                    child: LegendItem(color:AppTheme.appGreyColor, text: 'Latency')),
                Container(
                    width: width * 0.40,
                    child: LegendItem(color:AppTheme.appYellowColor, text: 'Rem Sleep')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: width * 0.40,
                    child: LegendItem(color:AppTheme.appPurpleColor, text: 'Restfulness')),
                Container(
                    width: width * 0.40,
                    child: LegendItem(color:AppTheme.appOrangeColor, text: 'Timing')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: width * 0.40,
                    child: LegendItem(color: AppTheme.appDeepPurpleColor, text: 'Total Sleep')),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
        SizedBox(height: 20),
        Container(
          height: height / 2,
          child: LineChart(
            LineChartData(
              lineBarsData: linesChart,
              // lineBarsData: [
              //   LineChartBarData(
              //     spots:deepSleep,
              //     isCurved: true,
              //     color: AppTheme.appBlueColor,
              //     barWidth: 2,
              //     belowBarData: BarAreaData(show: true, color:AppTheme.appBlueColor.withOpacity(0.3)),
              //   ),
              //   LineChartBarData(
              //     spots: efficiency,
              //     isCurved: true,
              //     color: AppTheme.appgreenColor,
              //     barWidth: 2,
              //     belowBarData: BarAreaData(show: true, color:AppTheme.appgreenColor.withOpacity(0.3)),
              //   ),LineChartBarData(
              //     spots: latency,
              //     isCurved: true,
              //     color: AppTheme.appGreyColor,
              //     barWidth: 2,
              //     belowBarData: BarAreaData(show: true, color:AppTheme.appGreyColor.withOpacity(0.3)),
              //   ),LineChartBarData(
              //     spots: remSleep,
              //     isCurved: true,
              //     color: AppTheme.appYellowColor,
              //     barWidth: 2,
              //     belowBarData: BarAreaData(show: true, color: AppTheme.appYellowColor.withOpacity(0.3)),
              //   ),LineChartBarData(
              //     spots: restfulness,
              //     isCurved: true,
              //     color: AppTheme.appPurpleColor,
              //     barWidth: 2,
              //     belowBarData: BarAreaData(show: true, color:AppTheme.appPurpleColor.withOpacity(0.3)),
              //   ),LineChartBarData(
              //     spots: timing,
              //     isCurved: true,
              //     color: AppTheme.appOrangeColor,
              //     barWidth: 2,
              //     belowBarData: BarAreaData(show: true, color:AppTheme.appOrangeColor.withOpacity(0.3)),
              //   ), LineChartBarData(
              //     spots: totalSleep,
              //     isCurved: true,
              //     color:  AppTheme.appDeepPurpleColor,
              //     barWidth: 2,
              //     belowBarData: BarAreaData(
              //         show: false, color: AppTheme.appDeepPurpleColor.withOpacity(0.3)),
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
                            style: const TextStyle(
                                fontSize: 10, color: Colors.black)),
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
