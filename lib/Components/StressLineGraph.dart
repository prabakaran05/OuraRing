import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ModelResponse/OuraApiResponse.dart';
import '../ModelResponse/StressResponse.dart';

class Stresslinegraph extends StatelessWidget {
  final List<OuraApiResponse> StressList;
  final List<LineChartBarData> linesChart;
  Stresslinegraph({super.key, required this.StressList, required this.linesChart});

  @override
  Widget build(BuildContext context) {


    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: width * 0.40,
                    child: LegendItem(color: Colors.cyan, text: 'Stress High')),
                Container(
                    width: width * 0.40,
                    child:
                        LegendItem(color: Colors.red, text: 'Stress Recovery')),
              ],
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  width: width * 0.40,
                  child: LegendItem(color: Colors.blue, text: 'Deap Sleep')),
              Container(
                  width: width * 0.40,
                  child: LegendItem(color: Colors.green, text: 'Efficiency')),
            ]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  width: width * 0.40,
                  child: LegendItem(color: Colors.grey, text: 'Latency')),
              Container(
                  width: width * 0.40,
                  child: LegendItem(color: Colors.yellow, text: 'Rem Sleep')),
            ]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  width: width * 0.40,
                  child: LegendItem(color: Colors.purple, text: 'Restfulness')),
              Container(
                  width: width * 0.40,
                  child: LegendItem(color: Colors.orange, text: 'spotsTiming')),
            ]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              // Container(
              //     width: width * 0.40,
              //     child:
              //         LegendItem(color: Colors.pinkAccent, text: 'Stress Recovery')),
              Container(
                  width: width * 0.40,
                  child: LegendItem(color: Colors.deepPurple, text: 'TotalSleep')),
            ]),
            SizedBox(height: 20),
          ],
        ),
        SizedBox(height: 20),
        Container(
          height: height / 2,
          child: LineChart(
            LineChartData(
              lineBarsData: linesChart,
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
                    reservedSize: 50, // try increase
                    getTitlesWidget: (value, meta) {
                      final left = value.toInt();
                      print(left);
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
