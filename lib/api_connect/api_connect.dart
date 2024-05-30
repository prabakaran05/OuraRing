import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../ModelResponse/StressResponse.dart';
import '../ModelResponse/SleepResponse.dart';
import '../Utilis/AppUtility.dart';
import '../Utilis/app_preference.dart';
import '../api_config/ApiUrl.dart';
import '../routes/app_routes.dart';

class ApiConnect extends GetConnect {
  @override
  onInit() async {
    super.allowAutoSignedCert = true;
    super.onInit();

    httpClient.addResponseModifier((request, response) {
      debugPrint("------------ AUTH ------------");
      debugPrint(
          "REQUEST METHOD: ${request.method} ; ENDPOINT:  ${request.url}");
      debugPrint("RESPONSE : ${response.bodyString}");
      return response;
    });
  }

  Future<SleepResponse> getSleepData(String Url) async {
    Map<String, String> header = {
      'Authorization': ApiUrl.ringToken,
    };
    var response = await get(Url,headers: header);
    if (response.body == null) {
      Fluttertoast.showToast(
        msg: AppUtility.somethingWrong,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
    if (response.statusCode! > 400 && response.statusCode! > 500) {
      AppPreference().clearData();
      Get.offAllNamed(AppRoutes.HomeScreen.toName);
    }
    return SleepResponse.fromJson(response.body);
  }

  Future<StressResponse> getStressData(String Url) async {
    Map<String, String> header = {
      'Authorization': ApiUrl.ringToken,
    };
    var response = await get(Url,headers: header);
    if (response.body == null) {
      Fluttertoast.showToast(
        msg: AppUtility.somethingWrong,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
    if (response.statusCode! > 400 && response.statusCode! > 500) {
      AppPreference().clearData();
      Get.offAllNamed(AppRoutes.HomeScreen.toName);
    }
    return StressResponse.fromJson(response.body);
  }



}
