import 'package:fl_chart/fl_chart.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oura_detect/ModelResponse/StressResponse.dart';
import 'package:oura_detect/api_config/ApiUrl.dart';
import '../ModelResponse/OuraApiResponse.dart';
import '../ModelResponse/SleepResponse.dart';
import '../Utilis/AppUtility.dart';
import '../Utilis/theme.dart';
import '../api_connect/api_connect.dart';

class HomeScreenController extends GetxController {
  RxString ringmessage = RxString("Swipe to add");
  RxBool ringswiped = RxBool(false);
  RxBool initialLoading = RxBool(false);
  TextEditingController TokenRingController = TextEditingController();
  RxString bedmessage = RxString("Swipe to add");
  RxBool bedswiped = RxBool(false);
  TextEditingController TokenBedController = TextEditingController();
  TextEditingController pointsController = TextEditingController(text: "All");
  final ApiConnect _connect = Get.put(ApiConnect());
  RxList<Contributors>? contributors = RxList();
  RxList<StressData> stressData = RxList();
  RxList<OuraApiResponse>? ouraApiResponse = RxList();
  RxList<String>? key = RxList();
  RxList<String> selectedPoints = RxList();
  List<LineChartBarData>? lineChart = [];
  String from_date = "";
  String to_date = "";
  RxString currentDate = RxString("");
  RxBool isPoints = RxBool(false);

  List<String> alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K"
  ];
  List<FlSpot> spotsDeepSleep = [];
  List<FlSpot> spotsEfficiency = [];
  List<FlSpot> spotsLatency = [];
  List<FlSpot> spotsRemSleep = [];
  List<FlSpot> spotsRestfulness = [];
  List<FlSpot> spotsTiming = [];
  List<FlSpot> spotsTotalSleep = [];
  List<FlSpot> spotsStressHigh = [];
  List<FlSpot> spotsStressRecovery = [];

  @override
  void onInit() async {
    super.onInit();

    from_date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', "01"]);
    to_date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
    currentDate.value = "${formatDate(DateTime.now(), [
          "01",
          '-',
          mm,
          '-',
          yyyy
        ])}  -  ${formatDate(DateTime.now(), [dd, '-', mm, '-', yyyy])}";

    key!.add("All");
    selectedPoints!.add("All");
    key!.add("Stress High");
    key!.add("Stress Recovery");
    key!.add("Deep Sleep");
    key!.add("Efficiency");
    key!.add("Latency");
    key!.add("Rem Sleep");
    key!.add("Restfulness");
    key!.add("Spot Timing");
    key!.add("Total Sleep");

    firstCall();
  }

  Future<void> generateCall() async {
    /*Adding the Points to their separate Array*/
    for (int i = 0; i < ouraApiResponse!.length; i++) {
      final contributors = ouraApiResponse![i];
      spotsStressHigh
          .add(FlSpot(i.toDouble(), contributors.stressHigh!.toDouble()));
      spotsStressRecovery
          .add(FlSpot(i.toDouble(), contributors.recoveryHigh!.toDouble()));
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
    lineChart!.clear();

    /*Condition for the Drop down*/
    if (selectedPoints.contains("All")) {
      lineChart!.add(
        LineChartBarData(
          spots: spotsStressHigh,
          isCurved: true,
          barWidth: 4,
          color: AppTheme.appCyanColor,
          belowBarData: BarAreaData(
            show: true,
            color: Colors.cyan.withOpacity(0.3),
          ),
        ),
      );
      lineChart!.add(
        LineChartBarData(
          spots: spotsStressRecovery,
          isCurved: true,
          barWidth: 4,
          color:AppTheme.appRedColor,
          belowBarData: BarAreaData(
            show: true,
            color: Colors.red.withOpacity(0.3),
          ),
        ),
      );
      lineChart!.add(
        LineChartBarData(
            spots: spotsDeepSleep,
            isCurved: true,
            barWidth: 4,
            color: AppTheme.appBlueColor,
            belowBarData:
                BarAreaData(show: true, color: Colors.blue.withOpacity(0.3))),
      );
      lineChart!.add(
        LineChartBarData(
            spots: spotsEfficiency,
            isCurved: true,
            barWidth: 4,
            color: AppTheme.appgreenColor,
            belowBarData:
                BarAreaData(show: true, color: Colors.green.withOpacity(0.3))),
      );
      lineChart!.add(
        LineChartBarData(
            spots: spotsLatency,
            isCurved: true,
            barWidth: 4,
            color: AppTheme.appGreyColor,
            belowBarData:
                BarAreaData(show: true, color: Colors.red.withOpacity(0.3))),
      );
      lineChart!.add(
        LineChartBarData(
            spots: spotsRemSleep,
            isCurved: true,
            barWidth: 4,
            color: AppTheme.appYellowColor,
            belowBarData:
                BarAreaData(show: true, color: Colors.yellow.withOpacity(0.3))),
      );
      lineChart!.add(
        LineChartBarData(
            spots: spotsRestfulness,
            isCurved: true,
            barWidth: 4,
            color: AppTheme.appPurpleColor,
            belowBarData:
                BarAreaData(show: true, color: Colors.purple.withOpacity(0.3))),
      );
      lineChart!.add(
        LineChartBarData(
            spots: spotsTiming,
            isCurved: true,
            barWidth: 4,
            color: AppTheme.appOrangeColor,
            belowBarData:
                BarAreaData(show: true, color: Colors.orange.withOpacity(0.3))),
      );
      lineChart!.add(
        LineChartBarData(
            spots: spotsTotalSleep,
            isCurved: true,
            barWidth: 4,
            color: AppTheme.appDeepPurpleColor,
            belowBarData:
                BarAreaData(show: true, color: Colors.cyan.withOpacity(0.3))),
      );
    } else {
      if (selectedPoints.contains("Stress High")) {
        lineChart!.add(
          LineChartBarData(
            spots: spotsStressHigh,
            isCurved: true,
            barWidth: 4,
            color:AppTheme.appCyanColor,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.cyan.withOpacity(0.3),
            ),
          ),
        );
      }
      if (selectedPoints.contains("Stress Recovery")) {
        lineChart!.add(
          LineChartBarData(
            spots: spotsStressRecovery,
            isCurved: true,
            barWidth: 4,
            color: AppTheme.appRedColor,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.red.withOpacity(0.3),
            ),
          ),
        );
      }
      if (selectedPoints.contains("Deep Sleep")) {
        lineChart!.add(
          LineChartBarData(
              spots: spotsDeepSleep,
              isCurved: true,
              barWidth: 4,
              color: AppTheme.appBlueColor,
              belowBarData:
                  BarAreaData(show: true, color: Colors.blue.withOpacity(0.3))),
        );
      }
      if (selectedPoints.contains("Efficiency")) {
        lineChart!.add(
          LineChartBarData(
              spots: spotsEfficiency,
              isCurved: true,
              barWidth: 4,
              color: AppTheme.appgreenColor,
              belowBarData: BarAreaData(
                  show: true, color: Colors.green.withOpacity(0.3))),
        );
      }
      if (selectedPoints.contains("Latency")) {
        lineChart!.add(
          LineChartBarData(
              spots: spotsLatency,
              isCurved: true,
              barWidth: 4,
              color: AppTheme.appGreyColor,
              belowBarData:
                  BarAreaData(show: true, color: Colors.red.withOpacity(0.3))),
        );
      }
      if (selectedPoints.contains("Rem Sleep")) {
        lineChart!.add(
          LineChartBarData(
              spots: spotsRemSleep,
              isCurved: true,
              barWidth: 4,
              color: AppTheme.appYellowColor,
              belowBarData: BarAreaData(
                  show: true, color: Colors.yellow.withOpacity(0.3))),
        );
      }
      if (selectedPoints.contains("Restfulness")) {
        lineChart!.add(
          LineChartBarData(
              spots: spotsRestfulness,
              isCurved: true,
              barWidth: 4,
              color: AppTheme.appPurpleColor,
              belowBarData: BarAreaData(
                  show: true, color: Colors.purple.withOpacity(0.3))),
        );
      }
      if (selectedPoints.contains("Spot Timing")) {
        lineChart!.add(
          LineChartBarData(
              spots: spotsTiming,
              isCurved: true,
              barWidth: 4,
              color: AppTheme.appOrangeColor,
              belowBarData: BarAreaData(
                  show: true, color: Colors.orange.withOpacity(0.3))),
        );
      }
      if (selectedPoints.contains("Total Sleep")) {
        lineChart!.add(
          LineChartBarData(
              spots: spotsTotalSleep,
              isCurved: true,
              barWidth: 4,
              color: AppTheme.appDeepPurpleColor,
              belowBarData:
                  BarAreaData(show: true, color: Colors.cyan.withOpacity(0.3))),
        );
      }
    }

    initialLoading.value = true;
    initialLoading.value = false;
  }

  Future<void> firstCall() async {
    if (!await AppUtility().connectionChecker()) {
      return;
    }
    initialLoading.value = true;

    AppUtility.loader(Get.context!, MsgEnum.COMMON_LOADING);
    String url =
        "${ApiUrl.baseUrl}${ApiUrl.getSleepData}${from_date}&end_date=${to_date}";
    var response = await _connect.getSleepData(url);
    print("sleepdataresponse$response");
    contributors!.clear();
    if (response.data != null) {
      Get.back();
      for (var data in response.data!) {
        contributors!.add(data.contributors!);
      }
      SecondCall();
    } else {
      Fluttertoast.showToast(
        msg: AppUtility.somethingWrong,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor:AppTheme.appBlack,
        textColor: AppTheme.primaryColor,
      );
    }
  }

  Future<void> SecondCall() async {
    if (!await AppUtility().connectionChecker()) {
      return;
    }

    AppUtility.loader(Get.context!, MsgEnum.COMMON_LOADING);
    String url =
        "${ApiUrl.baseUrl}${ApiUrl.getStressData}${from_date}&end_date=${to_date}";
    var response = await _connect.getStressData(url);
    print("Stressdataresponse$response");
    stressData.clear();
    if (response.data != null) {
      Get.back();
      stressData.value = response.data!;
      print("stress data ${stressData.value}");
      createOuraResponse();
    } else {
      Fluttertoast.showToast(
        msg: AppUtility.somethingWrong,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor:AppTheme.appBlack,
        textColor: AppTheme.primaryColor,
      );
    }
  }

  Future<void> createOuraResponse() async {
    ouraApiResponse!.clear();
    for (int i = 0; i < contributors!.length; i++) {
      OuraApiResponse data = OuraApiResponse();

      data.deepSleep = contributors![i].deepSleep;
      data.efficiency = contributors![i].efficiency;
      data.latency = contributors![i].latency;
      data.remSleep = contributors![i].remSleep;
      data.restfulness = contributors![i].restfulness;
      data.timing = contributors![i].timing;
      data.totalSleep = contributors![i].totalSleep;
      data.id = stressData![i].id;
      data.day = stressData![i].day;
      data.stressHigh = stressData![i].stressHigh;
      data.recoveryHigh = stressData![i].recoveryHigh;
      data.daySummary = stressData![i].daySummary;
      ouraApiResponse!.add(data);
    }
    generateCall();
    initialLoading.value = true;
    initialLoading.value = false;
  }

  Future<void> createExcel() async {
    final Workbook workbook = Workbook();
    int i;

    /*Creating Sheet and fitting data into it*/
    late Worksheet sheet;
    sheet = workbook.worksheets.addWithName("Oura");

    if (ouraApiResponse != null && ouraApiResponse!.isNotEmpty) {
      int j = 1;
      while (j < alphabet.length) {
        sheet.getRangeByName('A1').setText("Day");
        if (!selectedPoints.contains("All") &&
            selectedPoints.contains("Deep Sleep")) {
          sheet.getRangeByName('${alphabet[j]}1').setText("Deep Sleep");
        }
        if (!selectedPoints.contains("All") &&
            selectedPoints.contains("Efficiency")) {
          sheet.getRangeByName('${alphabet[j]}1').setText("Efficiency");
        }
        if (!selectedPoints.contains("All") &&
            selectedPoints.contains("Latency")) {
          sheet.getRangeByName('${alphabet[j]}1').setText("Latency");
        }

        if (!selectedPoints.contains("All") &&
            selectedPoints.contains("Rem Sleep")) {
          sheet.getRangeByName('${alphabet[j]}1').setText("Rem Sleep");
        }

        if (!selectedPoints.contains("All") &&
            selectedPoints.contains("Rem Sleep")) {
          sheet.getRangeByName('${alphabet[j]}1').setText("Restfulness");
        }

        if (!selectedPoints.contains("All") &&
            selectedPoints.contains("Timing")) {
          sheet.getRangeByName('${alphabet[j]}1').setText("Timing");
        }

        if (!selectedPoints.contains("All") &&
            selectedPoints.contains("Total Sleep")) {
          sheet.getRangeByName('${alphabet[j]}1').setText("Total Sleep");
        }

        if (!selectedPoints.contains("All") &&
            selectedPoints.contains("Stress High")) {
          sheet.getRangeByName('${alphabet[j]}1').setText("Stress High");
        }

        if (!selectedPoints.contains("All") &&
            selectedPoints.contains("Recovery High")) {
          sheet.getRangeByName('${alphabet[j]}1').setText("Recovery High");
        }

        if (!selectedPoints.contains("All") &&
            selectedPoints.contains("Recovery High")) {
          sheet.getRangeByName('${alphabet[j]}1').setText("Recovery High");
        }
        j++;
      }

      j = 0;

      for (i = 0; i < ouraApiResponse!.length; i++) {

        sheet
            .getRangeByName("A${i + 2}")
            .setText(ouraApiResponse![i].day.toString());

        sheet
            .getRangeByName("B${i + 2}")
            .setText(ouraApiResponse![i].deepSleep.toString());
        sheet
            .getRangeByName("C${i + 2}")
            .setText(ouraApiResponse![i].efficiency.toString());
        sheet
            .getRangeByName("D" + (i + 2).toString())
            .setText(ouraApiResponse![i].latency.toString());
        sheet
            .getRangeByName("E" + (i + 2).toString())
            .setText(ouraApiResponse![i].remSleep.toString());
        sheet
            .getRangeByName("F" + (i + 2).toString())
            .setText(ouraApiResponse![i].restfulness.toString());
        sheet
            .getRangeByName("G" + (i + 2).toString())
            .setText(ouraApiResponse![i].timing.toString());
        sheet
            .getRangeByName("H" + (i + 2).toString())
            .setText(ouraApiResponse![i].totalSleep.toString());
        sheet
            .getRangeByName("I" + (i + 2).toString())
            .setText(ouraApiResponse![i].stressHigh.toString());
        sheet
            .getRangeByName("J" + (i + 2).toString())
            .setText(ouraApiResponse![i].recoveryHigh.toString());
        sheet
            .getRangeByName("K" + (i + 2).toString())
            .setText(ouraApiResponse![i].daySummary.toString());
      }
    }

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName =
        Platform.isWindows ? '$path\\OuraOutput.xlsx' : '$path/OuraOutput.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }
}
