import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oura_detect/ModelResponse/StressResponse.dart';
import 'package:oura_detect/api_config/ApiUrl.dart';

import '../ModelResponse/SleepResponse.dart';
import '../ModelResponse/StressResponse.dart';
import '../ModelResponse/StressResponse.dart';
import '../Utilis/AppUtility.dart';
import '../api_connect/api_connect.dart';

class HomeScreenController extends GetxController {
  RxString ringmessage = RxString("Swipe to add");
  RxBool ringswiped = RxBool(false);
  RxBool initialLoading = RxBool(false);
  TextEditingController TokenRingController = TextEditingController();
  RxString bedmessage = RxString("Swipe to add");
  RxBool bedswiped = RxBool(false);
  TextEditingController TokenBedController = TextEditingController();
  final ApiConnect _connect = Get.put(ApiConnect());
  RxList<Contributors>? contributors = RxList();
  RxList<StressData> stressData = RxList();

  @override
  void onInit() async {
    super.onInit();
    firstCall();
    SecondCall();
  }

  Future<void> firstCall() async {
    if (!await AppUtility().connectionChecker()) {
      return;
    }

    AppUtility.loader(Get.context!, MsgEnum.COMMON_LOADING);
    String url =
        "${ApiUrl.baseUrl}${ApiUrl.getSleepData}2024-05-21&end_date=2024-05-28";
    var response = await _connect.getSleepData(url);
    print("sleepdataresponse$response");
    if (response.data != null) {
      Get.back();
      initialLoading.value = false;
      for (var data in response.data!) {
        contributors!.add(data.contributors!);
      }
    } else {
      Fluttertoast.showToast(
        msg: AppUtility.somethingWrong,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
  }

  Future<void> SecondCall() async {
    if (!await AppUtility().connectionChecker()) {
      return;
    }

    AppUtility.loader(Get.context!, MsgEnum.COMMON_LOADING);
    String url =
        "${ApiUrl.baseUrl}${ApiUrl.getStressData}2024-05-21&end_date=2024-05-28";
    var response = await _connect.getStressData(url);
    print("Stressdataresponse$response");
    if (response.data != null) {
      Get.back();
      initialLoading.value = false;
      stressData.value = response.data!;
      print("stress data ${stressData.value}");
    } else {
      Fluttertoast.showToast(
        msg: AppUtility.somethingWrong,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
  }
}
