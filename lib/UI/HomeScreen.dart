import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../Components/AppButton2.dart';
import '../Components/AppTabMenu.dart';
import '../Components/StressLineGraph.dart';
import '../Components/SleepLineGraph.dart';
import '../Components/TextInput.dart';
import '../Controller/HomeController.dart';
import '../Controller/forms.dart';
import '../Utilis/theme.dart';
import 'package:intl/intl.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    DateTime? startDate;
    DateTime? endDate;
    final RxString selectedText = RxString("");

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String getDateRangeText() {
      if (startDate != null && endDate != null) {
        selectedText.value =
            "${startDate!.day}.${startDate!.month}-${endDate!.day}.${endDate!.month}";
        return "${startDate!.day}.${startDate!.month}-${endDate!.day}.${endDate!.month}";
      } else {
        return "05.10-12.10";
      }
    }

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
                    AppTheme.appgreen, // #119A8E color
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
                          height: height * 0.17,
                          width: width * 0.2,
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
                                  color: AppTheme.primaryColor,
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
                    AppTheme.appgreen, // #119A8E color
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
                          width: width * 0.2,
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
                          // controller.bedmessage.value = "Adding ring";
                          // controller.bedswiped.value = true;
                          // addToken(context);
                          Fluttertoast.showToast(
                            msg: "In Development",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: AppTheme.appBlack,
                            textColor: AppTheme.primaryColor,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Visibility(
              visible: true,
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "Stress Chart",
                        style:
                            TextStyle(color: AppTheme.appBlack, fontSize: 24),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextInputField(
                        controller: controller.pointsControllerSecond,
                        height: 100,
                        label: "Chart Points ",
                        onPressed: () {
                          controller.isPointsSecond.value =
                              !controller.isPointsSecond.value;
                        },
                        textInputType: TextInputType.phone,
                        textColor: AppTheme.selectPointTextColor,
                        hintText: "Select Points",
                        obscureText: true,
                        isReadOnly: true,
                        margin: false,
                        onTextChange: (String) {},
                      ),
                      Obx(() => Visibility(
                            visible: controller.isPointsSecond.value,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(12, 4, 12, 0),
                              padding: const EdgeInsets.fromLTRB(6, 4, 6, 6),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppTheme.inputBorderColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: AppTheme
                                    .primaryColor, // Set the desired background color
                              ),
                              child: IntrinsicHeight(
                                child: Column(
                                  children: List.generate(
                                    controller.keySecond!.length,
                                    (index) {
                                      var model = controller.keySecond![index];
                                      return Container(
                                        child: Column(
                                          children: [
                                            TextInputField(
                                              onPressed: () {
                                                if (controller
                                                    .selectedPoints.value
                                                    .any((e) =>
                                                        e
                                                            .toString()
                                                            .contains("All") &&
                                                        model != "All")) {
                                                  int indexToRemove = controller
                                                      .selectedPoints.value
                                                      .indexWhere((e) => e
                                                          .toString()
                                                          .contains("All"));

                                                  if (indexToRemove != -1) {
                                                    controller
                                                        .selectedPoints.value
                                                        .removeAt(
                                                            indexToRemove);
                                                  }
                                                }

                                                if (!controller
                                                    .selectedPoints.value
                                                    .any((e) => e
                                                        .toString()
                                                        .contains(model!))) {
                                                  if (model == "All") {
                                                    controller.selectedPoints
                                                        .clear();
                                                  }

                                                  controller
                                                      .selectedPoints.value
                                                      .add(model!);
                                                } else {
                                                  int indexToRemove = controller
                                                      .selectedPoints.value
                                                      .indexWhere((e) => e
                                                          .toString()
                                                          .contains(model!));

                                                  if (indexToRemove != -1) {
                                                    controller
                                                        .selectedPoints.value
                                                        .removeAt(
                                                            indexToRemove);
                                                  }
                                                }

                                                controller.pointsControllerSecond
                                                    .text = jsonEncode(
                                                        controller
                                                            .selectedPoints
                                                            .value)
                                                    .replaceAll(
                                                        RegExp(r'[\[\]]'), '')
                                                    .replaceAll("\"", '');

                                                if (controller
                                                        .keySecond!.length ==
                                                    1) {
                                                  controller.isPointsSecond
                                                      .value = false;
                                                } else {
                                                  controller.isPointsSecond
                                                      .value = false;
                                                  controller.isPointsSecond
                                                      .value = true;
                                                }
                                              },
                                              margin: false,
                                              isSelected: controller
                                                  .selectedPoints.value
                                                  .any((e) => e
                                                      .toString()
                                                      .contains(model!)),
                                              label: "",
                                              dropDownWithCheckBox: true,
                                              isEntryField: false,
                                              textInputType: TextInputType.text,
                                              textColor:
                                                  const Color(0xCC234345),
                                              hintText: model!,
                                              obscureText: true,
                                              onTextChange: (String) {},
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            (controller.keySecond!.length -
                                                        1) !=
                                                    index
                                                ? Container(
                                                    height: 1,
                                                    color: AppTheme.divderColor,
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          controller
                                                              .generateCallSecond();
                                                          controller
                                                              .isPointsSecond
                                                              .value = false;
                                                        },
                                                        child: Container(
                                                          height: 40,
                                                          width: 40,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 20),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                              color: AppTheme
                                                                  .appgreen),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_circle_right,
                                                              color: AppTheme
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.borderShade1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 8, bottom: 8),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/Images/datePicker.png",
                                height: 20,
                                width: 20,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Obx(
                                  () => Text(
                                    controller.currentDate.value,
                                    style: TextStyle(
                                      color: AppTheme.appBlack,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.bottomSheet(SingleChildScrollView(
                              child: Container(
                            decoration: const BoxDecoration(
                                color: AppTheme.primaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 15, bottom: 7),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(height: 20, width: 20),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: const Text("Select Date",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color:
                                                      AppTheme.secondaryColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Icon(Icons.clear))
                                    ],
                                  ),
                                ),
                                Divider(),
                                SfDateRangePicker(
                                  view: DateRangePickerView.month,
                                  selectionMode:
                                      DateRangePickerSelectionMode.range,
                                  selectionShape:
                                      DateRangePickerSelectionShape.rectangle,
                                  backgroundColor: AppTheme.primaryColor,
                                  selectionTextStyle: const TextStyle(
                                      color: AppTheme.primaryColor),
                                  yearCellStyle: DateRangePickerYearCellStyle(
                                      cellDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4))),
                                  startRangeSelectionColor:
                                      AppTheme.secondaryColor,
                                  endRangeSelectionColor:
                                      AppTheme.secondaryColor,
                                  rangeTextStyle: const TextStyle(
                                    color: AppTheme.appBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  headerStyle: const DateRangePickerHeaderStyle(
                                    textAlign: TextAlign.center,
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppTheme.labelColor90),
                                  ),
                                  selectionRadius: 0,
                                  onSelectionChanged:
                                      (DateRangePickerSelectionChangedArgs
                                          args) {
                                    startDate = args.value.startDate;
                                    endDate = args.value.endDate;

                                    if (startDate != null) {
                                      controller.from_date =
                                          "${startDate!.year}-${startDate!.month}-${startDate!.day}";
                                    }
                                    if (endDate != null) {
                                      controller.to_date =
                                          "${endDate!.year}-${endDate!.month}-${endDate!.day}";
                                    }
                                    getDateRangeText();
                                  },
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AppButton2(
                                      width: width * 0.45,
                                      height: 40,
                                      title: 'Cancel',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      onPressed: () {
                                        Get.back();
                                      },
                                      color: AppTheme.primaryColor,
                                      titleColor:
                                          AppTheme.bottomTabsLabelInActiveColor,
                                      borderColor: AppTheme.cancelBorder,
                                    ),
                                    AppButton2(
                                      width: width * 0.45,
                                      height: 40,
                                      title: 'Apply ',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      onPressed: () {
                                        controller.currentDate.value =
                                            "${DateFormat('dd-MM-yyyy').format(startDate!)}  -  ${DateFormat('dd-MM-yyyy').format(endDate!)}";

                                        controller.from_date =
                                            "${DateFormat('yyyy-MM-dd').format(startDate!)}";
                                        controller.to_date =
                                            "${DateFormat('yyyy-MM-dd').format(endDate!)}";
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) async {
                                          controller.SecondCall();
                                        });
                                        Get.back();
                                      },
                                      titleColor: AppTheme.primaryColor,
                                      color: AppTheme.secondaryColor,
                                      borderColor: AppTheme.secondaryColor,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          )));
                        },
                      ),
                      AppTabMenu(
                        margin: EdgeInsets.zero,
                        title: "Export",
                        // disable: !model.status,
                        isSelected: true,
                        onClick: () {
                          controller.createExcel();
                        },
                      )
                    ],
                  ),
                  Obx(
                    () => controller.initialLoading.isFalse
                        ? StressLineGraph(
                            StressList: controller.ouraApiResponse!,
                            linesChart: controller.lineChartSecond!)
                        : Container(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
             Row(
               children: [
                 Text(
                  "Sleep Chart",
                  style: TextStyle(color: AppTheme.appBlack, fontSize: 24),
                             ),
               ],
             ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextInputField(
                  controller: controller.pointsController,
                  height: 100,
                  label: "Chart Points ",
                  onPressed: () {
                    controller.isPoints.value = !controller.isPoints.value;
                  },
                  textInputType: TextInputType.phone,
                  textColor: AppTheme.selectPointTextColor,
                  hintText: "Select Points",
                  obscureText: true,
                  isReadOnly: true,
                  margin: false,
                  onTextChange: (String) {},
                ),
                Obx(() => Visibility(
                      visible: controller.isPoints.value,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(12, 4, 12, 0),
                        padding: const EdgeInsets.fromLTRB(6, 4, 6, 6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.inputBorderColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: AppTheme
                              .primaryColor, // Set the desired background color
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            children: List.generate(
                              controller.key!.length,
                              (index) {
                                var model = controller.key![index];
                                return Container(
                                  child: Column(
                                    children: [
                                      TextInputField(
                                        onPressed: () {
                                          if (controller.selectedPoints.value
                                              .any((e) =>
                                                  e
                                                      .toString()
                                                      .contains("All") &&
                                                  model != "All")) {
                                            int indexToRemove = controller
                                                .selectedPoints.value
                                                .indexWhere((e) => e
                                                    .toString()
                                                    .contains("All"));

                                            if (indexToRemove != -1) {
                                              controller.selectedPoints.value
                                                  .removeAt(indexToRemove);
                                            }
                                          }

                                          if (!controller.selectedPoints.value
                                              .any((e) => e
                                                  .toString()
                                                  .contains(model!))) {
                                            if (model == "All") {
                                              controller.selectedPoints.clear();
                                            }

                                            controller.selectedPoints.value
                                                .add(model!);
                                          } else {
                                            int indexToRemove = controller
                                                .selectedPoints.value
                                                .indexWhere((e) => e
                                                    .toString()
                                                    .contains(model!));

                                            if (indexToRemove != -1) {
                                              controller.selectedPoints.value
                                                  .removeAt(indexToRemove);
                                            }
                                          }

                                          controller.pointsController
                                              .text = jsonEncode(controller
                                                  .selectedPoints.value)
                                              .replaceAll(RegExp(r'[\[\]]'), '')
                                              .replaceAll("\"", '');

                                          if (controller.key!.length == 1) {
                                            controller.isPoints.value = false;
                                          } else {
                                            controller.isPoints.value = false;
                                            controller.isPoints.value = true;
                                          }
                                        },
                                        margin: false,
                                        isSelected: controller
                                            .selectedPoints.value
                                            .any((e) =>
                                                e.toString().contains(model!)),
                                        label: "",
                                        dropDownWithCheckBox: true,
                                        isEntryField: false,
                                        textInputType: TextInputType.text,
                                        textColor: const Color(0xCC234345),
                                        hintText: model!,
                                        obscureText: true,
                                        onTextChange: (String) {},
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      (controller.key!.length - 1) != index
                                          ? Container(
                                              height: 1,
                                              color: AppTheme.divderColor,
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller.generateCall();
                                                    controller.isPoints.value =
                                                        false;
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    margin: EdgeInsets.only(
                                                        top: 20),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color:
                                                            AppTheme.appgreen),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons
                                                            .arrow_circle_right,
                                                        color: AppTheme
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.borderShade1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/Images/datePicker.png",
                          height: 20,
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          child: Obx(
                            () => Text(
                              controller.currentDate.value,
                              style: TextStyle(
                                color: AppTheme.appBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.bottomSheet(SingleChildScrollView(
                        child: Container(
                      decoration: const BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 15, bottom: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(height: 20, width: 20),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: const Text("Select Date",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppTheme.secondaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(Icons.clear))
                              ],
                            ),
                          ),
                          Divider(),
                          SfDateRangePicker(
                            view: DateRangePickerView.month,
                            selectionMode: DateRangePickerSelectionMode.range,
                            selectionShape:
                                DateRangePickerSelectionShape.rectangle,
                            backgroundColor: AppTheme.primaryColor,
                            selectionTextStyle:
                                const TextStyle(color: AppTheme.primaryColor),
                            yearCellStyle: DateRangePickerYearCellStyle(
                                cellDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4))),
                            startRangeSelectionColor: AppTheme.secondaryColor,
                            endRangeSelectionColor: AppTheme.secondaryColor,
                            rangeTextStyle: const TextStyle(
                              color: AppTheme.appBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            headerStyle: const DateRangePickerHeaderStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.labelColor90),
                            ),
                            selectionRadius: 0,
                            onSelectionChanged:
                                (DateRangePickerSelectionChangedArgs args) {
                              startDate = args.value.startDate;
                              endDate = args.value.endDate;

                              if (startDate != null) {
                                controller.from_date =
                                    "${startDate!.year}-${startDate!.month}-${startDate!.day}";
                              }
                              if (endDate != null) {
                                controller.to_date =
                                    "${endDate!.year}-${endDate!.month}-${endDate!.day}";
                              }
                              getDateRangeText();
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppButton2(
                                width: width * 0.45,
                                height: 40,
                                title: 'Cancel',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                onPressed: () {
                                  Get.back();
                                },
                                color: AppTheme.primaryColor,
                                titleColor:
                                    AppTheme.bottomTabsLabelInActiveColor,
                                borderColor: AppTheme.cancelBorder,
                              ),
                              AppButton2(
                                width: width * 0.45,
                                height: 40,
                                title: 'Apply ',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                onPressed: () {
                                  controller.currentDate.value =
                                      "${DateFormat('dd-MM-yyyy').format(startDate!)}  -  ${DateFormat('dd-MM-yyyy').format(endDate!)}";

                                  controller.from_date =
                                      "${DateFormat('yyyy-MM-dd').format(startDate!)}";
                                  controller.to_date =
                                      "${DateFormat('yyyy-MM-dd').format(endDate!)}";
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) async {
                                    controller.firstCall();
                                  });
                                  Get.back();
                                },
                                titleColor: AppTheme.primaryColor,
                                color: AppTheme.secondaryColor,
                                borderColor: AppTheme.secondaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    )));
                  },
                ),
                AppTabMenu(
                  margin: EdgeInsets.zero,
                  title: "Export",
                  // disable: !model.status,
                  isSelected: true,
                  onClick: () {
                    controller.createExcel();
                  },
                )
              ],
            ),
            Obx(
              () => controller.initialLoading.isFalse
                  ? Sleeplinegraph(
                      StressList: controller.ouraApiResponse!,
                      linesChart: controller.lineChart!)
                  : Container(),
            )
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
        builder: (context) => AlertDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add Token",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textColor),
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.cancel))
                  ],
                ),
              ),
              titlePadding: EdgeInsets.only(left: 5, right: 0),
              content: TextInput(
                controller: controller.TokenBedController,
                margin: true,
                height: 80,
                label: "",
                onTextChange: (text) {},
                textInputType: TextInputType.text,
                textColor: AppTheme.selectPointTextColor,
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
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppTheme.appgreen),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_circle_right,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ));
  }
}
