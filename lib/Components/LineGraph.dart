import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ModelResponse/OuraApiResponse.dart';
import '../ModelResponse/SleepResponse.dart';
import '../Utilis/theme.dart';

class LineChartWidget extends StatelessWidget {

  final List<OuraApiResponse> StressList;
  LineChartWidget({required this.StressList});

  @override
  Widget build(BuildContext context){

    List<FlSpot> spotsDeepSleep = [];
    List<FlSpot> spotsEfficiency = [];

    for (int i = 0; i < StressList.length; i++) {
      final contributors = StressList[i];
      spotsDeepSleep
          .add(FlSpot(i.toDouble(), contributors.deepSleep!.toDouble()));
      spotsEfficiency
          .add(FlSpot(i.toDouble(), contributors.efficiency!.toDouble()));
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
                color:AppTheme.appBlueColor,
                belowBarData: BarAreaData(
                    show: true, color: Colors.blue.withOpacity(0.3))),
            LineChartBarData(
                spots: spotsEfficiency,
                isCurved: true,
                barWidth: 4,
                color: AppTheme.appgreenColor,
                belowBarData: BarAreaData(
                    show: true, color: Colors.green.withOpacity(0.3))),
          ],
          // titlesData: FlTitlesData(
          //   leftTitles: AxisTitles(
          //     sideTitles: SideTitles(showTitles: true),
          //     axisNameWidget: Text('Value',style: TextStyle(color: Colors.black),),
          //     axisNameSize: 16,
          //   ),
          //   bottomTitles: AxisTitles(
          //     sideTitles: SideTitles(
          //       showTitles: true,
          //       getTitlesWidget: (value, meta) {
          //         final index = value.toInt();
          //         if (index < 0 || index >= contributorsList.length) {
          //           return const Text('hello',style: TextStyle(color: Colors.red));
          //         }
          //         return SideTitleWidget(
          //           axisSide: meta.axisSide,
          //           child: Text('Day ${index + 1}',style: TextStyle(color: Colors.black),),
          //         );
          //       },
          //     ),
          //     axisNameWidget: Text('Days',style: TextStyle(color: Colors.black),),
          //     axisNameSize: 16,
          //   ),
          // ),
          borderData: FlBorderData(
            show: false,
          ),
        ),
      ),
    );
  }
}
