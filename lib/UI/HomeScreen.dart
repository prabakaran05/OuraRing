import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../Controller/HomeController.dart';
import '../Forms/Theme.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Obx(
      () => Column(children: [
        SizedBox(
          height: height * 0.04,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Text(
                "WELCOME",
                style:
                    TextStyle(fontSize: 34, color: AppTheme.welcometextColor),
              ),
              SizedBox(width: width * 0.01),
              Container(
                height: height * 0.03,
                child: Text(
                  "Reyaf",
                  style:
                      TextStyle(fontSize: 24, color: AppTheme.primarynameColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment(-1.0, 0.0),
                // Corresponds to 89.7 degrees
                end: Alignment(1.0, 0.0),
                // End point for the gradient
                colors: [
                  AppTheme.mix1Color, // #119A8E color
                  AppTheme.mix2Color, // #119A8E color
                  // #36EC7D color
                ],
                stops: [0.003, 0.998], // 0.3% and 99.8% stops
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                        height: height * 0.15,
                        // width: width*0.1,
                        child: Image.asset("assets/Images/imagering.png")),
                  ),
                  Expanded(
                    child: SwipeButton(
                      thumb: controller.ringswiped.value
                          ? Material(
                              elevation: 0,
                              color: Colors.transparent,
                              shadowColor: Colors.transparent,
                            )
                          : Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                              child: Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.white,
                              ),
                            ),
                      activeThumbColor: controller.ringswiped.value
                          ? Colors.transparent
                          : Colors.black.withOpacity(0.9),
                      activeTrackColor: controller.ringswiped.value
                          ? Colors.black.withOpacity(0.9)
                          : AppTheme.draggerColor,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: controller.ringswiped.value
                            ? Text(
                                controller.ringmessage.value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                            : Text(
                                controller.ringmessage.value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                      onSwipe: () {
                        controller.ringmessage.value = "Adding ring";
                        controller.ringswiped.value = true;
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Enter Token"),
                              content: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Opacity(
                                  opacity: 0.6,
                                  // Adjust the opacity as needed
                                  child: Container(
                                    height: height * 0.07,
                                    decoration: BoxDecoration(
                                      color: AppTheme.textfieldrgeyColor,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: TextField(
                                      controller:
                                          controller.TokenRingController,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                        ),
                                        hintText: 'Token',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    controller.ringswiped.value = false;
                                    controller.ringmessage.value =
                                        "Swipe to add ring";
                                  },
                                ),
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Container(
            height: height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment(-1.0, 0.0),
                // Corresponds to 89.7 degrees
                end: Alignment(1.0, 0.0),
                // End point for the gradient
                colors: [
                  AppTheme.mix1Color, // #119A8E color
                  AppTheme.mix2Color, // #119A8E color
                  // #36EC7D color
                ],
                stops: [0.003, 0.998], // 0.3% and 99.8% stops
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                        height: height * 0.17,
                        width: width * 0.3,
                        child: Image.asset("assets/Images/imagebed.png")),
                  ),
                  Expanded(
                    child: SwipeButton(
                      thumb: controller.bedswiped.value
                          ? Material(
                              elevation: 0,
                              color: Colors.transparent,
                              shadowColor: Colors.transparent,
                            )
                          : Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                              child: Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.white,
                              ),
                            ),
                      activeThumbColor: controller.bedswiped.value
                          ? Colors.transparent
                          : Colors.black.withOpacity(0.9),
                      activeTrackColor: controller.bedswiped.value
                          ? Colors.black.withOpacity(0.9)
                          : AppTheme.draggerColor,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: controller.bedswiped.value
                            ? Text(
                                controller.bedmessage.value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                            : Text(
                                controller.bedmessage.value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                      onSwipe: () {
                        controller.bedmessage.value = "Adding ring";
                        controller.bedswiped.value = true;
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Enter Token"),
                              content: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Opacity(
                                  opacity: 0.6,
                                  // Adjust the opacity as needed
                                  child: Container(
                                    height: height * 0.07,
                                    decoration: BoxDecoration(
                                      color: AppTheme.textfieldrgeyColor,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: TextField(
                                      controller: controller.TokenBedController,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize: 17,
                                        ),
                                        hintText: 'Token',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    controller.bedswiped.value = false;
                                    controller.bedmessage.value =
                                        "Swipe to add bed";
                                  },
                                ),
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
