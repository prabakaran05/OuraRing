import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ModelResponse/SleepResponse.dart';

class LineChartWidget extends StatelessWidget {
  final List<Contributors> contributorsList;

  LineChartWidget({required this.contributorsList});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spotsDeepSleep = [];
    List<FlSpot> spotsEfficiency = [];
    List<FlSpot> spotsLatency = [];
    List<FlSpot> spotsRemSleep = [];
    List<FlSpot> spotsRestfulness = [];
    List<FlSpot> spotsTiming = [];
    List<FlSpot> spotsTotalSleep = [];

    for (int i = 0; i < contributorsList.length; i++) {
      final contributors = contributorsList[i];
      spotsDeepSleep
          .add(FlSpot(i.toDouble(), contributors.deepSleep!.toDouble()));
      spotsEfficiency
          .add(FlSpot(i.toDouble(), contributors.efficiency!.toDouble()));
      spotsLatency.add(FlSpot(i.toDouble(), contributors.latency!.toDouble()));
      spotsRemSleep
          .add(FlSpot(i.toDouble(), contributors.remSleep!.toDouble()));
      spotsRestfulness
          .add(FlSpot(i.toDouble(), contributors.restfulness!.toDouble()));
      spotsTiming.add(FlSpot(i.toDouble(), contributors.timing!.toDouble()));
      spotsTotalSleep
          .add(FlSpot(i.toDouble(), contributors.totalSleep!.toDouble()));
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height / 2,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
                spots: spotsDeepSleep,
                isCurved: true,
                barWidth: 4,
                color: Colors.blue,
                belowBarData: BarAreaData(
                    show: true, color: Colors.blue.withOpacity(0.3))),
            LineChartBarData(
                spots: spotsEfficiency,
                isCurved: true,
                barWidth: 4,
                color: Colors.green,
                belowBarData: BarAreaData(
                    show: true, color: Colors.green.withOpacity(0.3))),
            LineChartBarData(
                spots: spotsLatency,
                isCurved: true,
                barWidth: 4,
                color: Colors.red,
                belowBarData: BarAreaData(
                    show: true, color: Colors.red.withOpacity(0.3))),
            LineChartBarData(
                spots: spotsRemSleep,
                isCurved: true,
                barWidth: 4,
                color: Colors.yellow,
                belowBarData: BarAreaData(
                    show: true, color: Colors.yellow.withOpacity(0.3))),
            LineChartBarData(
                spots: spotsRestfulness,
                isCurved: true,
                barWidth: 4,
                color: Colors.purple,
                belowBarData: BarAreaData(
                    show: true, color: Colors.purple.withOpacity(0.3))),
            LineChartBarData(
                spots: spotsTiming,
                isCurved: true,
                barWidth: 4,
                color: Colors.orange,
                belowBarData: BarAreaData(
                    show: true, color: Colors.orange.withOpacity(0.3))),
            LineChartBarData(
                spots: spotsTotalSleep,
                isCurved: true,
                barWidth: 4,
                color: Colors.cyan,
                belowBarData: BarAreaData(
                    show: true, color: Colors.cyan.withOpacity(0.3))),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
              axisNameWidget: Text('Value',style: TextStyle(color: Colors.black),),
              axisNameSize: 16,
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= contributorsList.length) {
                    return const Text('hello',style: TextStyle(color: Colors.red));
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text('Day ${index + 1}',style: TextStyle(color: Colors.black),),
                  );
                },
              ),
              axisNameWidget: Text('Days',style: TextStyle(color: Colors.black),),
              axisNameSize: 16,
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
        ),
      ),
    );
  }
}
