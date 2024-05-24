import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeScreenController extends GetxController {

  RxString ringmessage =  RxString("Swipe to add ring");
  RxBool ringswiped = RxBool(false);
  TextEditingController TokenRingController = TextEditingController();
  RxString bedmessage =  RxString("Swipe to add bed");
  RxBool bedswiped = RxBool(false);
  TextEditingController TokenBedController = TextEditingController();
}