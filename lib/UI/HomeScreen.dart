import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../Components/LineGraph.dart';
import '../Components/TextInput.dart';
import '../Controller/HomeController.dart';
import '../Utilis/theme.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: height * 0.04,
            ),
            const Text(
              "Welcome!",
              style: TextStyle(fontSize: 28, color: AppTheme.textColor),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              height: height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment(-1.0, 0.0),
                  // Corresponds to 89.7 degrees
                  end: Alignment(1.0, 0.0),
                  // End point for the gradient
                  colors: [
                    AppTheme.green, // #119A8E color
                    AppTheme.fluorescentGreen, // #119A8E color
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
                            ? const Material(
                                elevation: 0,
                                color: Colors.transparent,
                                shadowColor: Colors.transparent,
                              )
                            : Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                child: const Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                ),
                              ),
                        activeThumbColor: controller.ringswiped.value
                            ? Colors.transparent
                            : Colors.black.withOpacity(0.9),
                        activeTrackColor: controller.ringswiped.value
                            ? Colors.black.withOpacity(0.9)
                            : AppTheme.liteGreen,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Obx(
                            () => Text(
                              controller.ringmessage.value,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  color: AppTheme.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        onSwipe: () {
                          controller.ringmessage.value = "Adding ring";
                          controller.ringswiped.value = true;
                          addToken(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment(-1.0, 0.0),
                  // Corresponds to 89.7 degrees
                  end: Alignment(1.0, 0.0),
                  // End point for the gradient
                  colors: [
                    AppTheme.green, // #119A8E color
                    AppTheme.fluorescentGreen, // #119A8E color
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
                            ? const Material(
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
                            : AppTheme.liteGreen,
                        child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: Obx(() => Text(
                                  controller.bedmessage.value,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      color: AppTheme.textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ))),
                        onSwipe: () {
                          controller.bedmessage.value = "Adding ring";
                          controller.bedswiped.value = true;
                          addToken(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => controller.initialLoading.isFalse &&
                      controller.contributors!.isNotEmpty
                  ? LineChartWidget(
                    contributorsList: controller.contributors!,
                  )
                  : Container(),
            ),
            SizedBox(
              height: height*0.1,
            ),
            Obx(
              () => controller.initialLoading.isFalse &&
                      controller.contributors!.isNotEmpty
                  ? LineChartWidget(
                    contributorsList: controller.contributors!,
                  )
                  : Container(),
            ),
            SizedBox(
              height: height*0.1,
            ),
            Obx(
              () => controller.initialLoading.isFalse &&
                      controller.contributors!.isNotEmpty
                  ? LineChartWidget(
                    contributorsList: controller.contributors!,
                  )
                  : Container(),
            ),
          ]),
        ),
      )),
    );
  }

  static Future addToken(
    BuildContext context,
  ) {
    HomeScreenController controller = Get.put(HomeScreenController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    controller.bedswiped.value = false;
    controller.ringswiped.value = false;
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: const Text(
                "Add Token",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.textColor),
              ),
              content: TextInput(
                controller: controller.TokenBedController,
                margin: true,
                height: 80,
                label: "",
                onTextChange: (text) {},
                textInputType: TextInputType.text,
                textColor: Color(0xCC252525),
                hintText: "Enter Token",
                isReadOnly: false,
                obscureText: false,
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppTheme.green),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_circle_right,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ));
  }
}
