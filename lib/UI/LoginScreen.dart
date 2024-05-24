
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../Controller/LoginController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../Controller/LoginController.dart';
import '../Forms/Theme.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    LoginScreenController controller = Get.put(LoginScreenController());
    return Scaffold(
      // backgroundColor: Color(0xFF0D111C),
      // backgroundColor: ,

      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(
      //         "assets/Images/Subtract.png   ",
      //       ),
      //       fit: BoxFit.contain,
      //     ),
      //   ),
      //   child:
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(
      //         width: 10,
      //       ),
      //       // Container(
      //       //   width: width * 0.95,
      //       //   margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      //       //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      //       //   decoration: BoxDecoration(
      //       //     borderRadius: BorderRadius.circular(10),
      //       //     color: Colors.white,
      //       //   ),
      //       //   child: Column(
      //       //     children: [
      //       //
      //       //       // Padding(
      //       //       //   padding: const EdgeInsets.symmetric(horizontal: 10),
      //       //       //   child: TextFormField(
      //       //       //       controller: controller.userController,
      //       //       //       decoration: InputDecoration(
      //       //       //         contentPadding: EdgeInsets.only(left: 20),
      //       //       //         border: OutlineInputBorder(),
      //       //       //         enabledBorder: OutlineInputBorder(
      //       //       //           borderSide: BorderSide(color: Color(0xFF505050)),
      //       //       //           borderRadius: BorderRadius.circular(10),
      //       //       //         ),
      //       //       //         focusedBorder: OutlineInputBorder(
      //       //       //           borderSide: BorderSide(color: Color(0xFF505050)),
      //       //       //           borderRadius: BorderRadius.circular(10),
      //       //       //         ),
      //       //       //         labelText: 'User Name',
      //       //       //         hintText: '',
      //       //       //         labelStyle: const TextStyle(
      //       //       //           fontSize: 15,
      //       //       //           fontWeight: FontWeight.w400,
      //       //       //           color: Colors.black87,
      //       //       //         ),
      //       //       //         hintStyle: const TextStyle(
      //       //       //           fontSize: 15,
      //       //       //           fontWeight: FontWeight.w400,
      //       //       //           color: Colors.black87,
      //       //       //         ),
      //       //       //       ),
      //       //       //       style: const TextStyle(
      //       //       //         fontSize: 15,
      //       //       //         fontWeight: FontWeight.w400,
      //       //       //         color: Colors.black,
      //       //       //       )),
      //       //       // ),
      //       //
      //       //       // Center(child: Image.asset("lib/assets/Subtract.png")),
      //       //       // Padding(
      //       //       //   padding: const EdgeInsets.all(8.0),
      //       //       //   child: Button(
      //       //       //       widthFactor: 0.88,
      //       //       //       heightFactor: 0.055,
      //       //       //       onPressed: () {
      //       //       //         controller.login(context);
      //       //       //       },
      //       //       //       child: const Text("LOGIN",
      //       //       //           style: TextStyle(
      //       //       //               fontSize: 18,
      //       //       //               color: Colors.white,
      //       //       //               fontWeight: FontWeight.w600))),
      //       //       // ),
      //       //       SizedBox(
      //       //         height: 10,
      //       //       ),
      //       //     ],
      //       //   ),
      //       // )
      //     ],
      // // backgroundColor: AppTheme.transparentColor,
      // // backgroundColor: ,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment(0.2, 1),
                child: Image.asset(
                  "assets/Images/Subtract.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: height * 0.04),
                Container(
                  height: height * 0.17,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(width: width * 0.03),
                        Column(
                          children: [
                            Text(
                              "LOREM",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "IPSUM",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // VerticalDivider(
                        //   width: 20,
                        //   thickness: 3,
                        //   indent: 0,
                        //   endIndent: 8,
                        //   color: AppTheme.darkdividerColor,
                        // ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            height: height * 0.11,
                            width: width * 0.012,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: AppTheme.darkdividerColor,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 5),
                              child: Image.asset(
                                "assets/Images/Stay_Healthy.png",
                                height: height * 0.06,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Opacity(
                    opacity: 0.6, // Adjust the opacity as needed
                    child: Container(
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        color: AppTheme.textfieldrgeyColor,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextField(
                        controller: controller.nameController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                          hintText: 'Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Opacity(
                    opacity: 0.6, // Adjust the opacity as needed
                    child: Container(
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        color: AppTheme.textfieldrgeyColor,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                          hintText: 'Email',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Opacity(
                    opacity: 0.6, // Adjust the opacity as needed
                    child: Container(
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        color: AppTheme.textfieldrgeyColor,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextField(
                        controller: controller.phonenoController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                          hintText: 'Phone No',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Opacity(
                    opacity: 0.6, // Adjust the opacity as needed
                    child: Container(
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        color: AppTheme.textfieldrgeyColor,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                          hintText: 'Password',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Opacity(
                    opacity: 0.6, // Adjust the opacity as needed
                    child: Container(
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        color: AppTheme.textfieldrgeyColor,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: TextField(
                        controller: controller.confirmpasswordController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 17,
                          ),
                          hintText: 'Confirm Password',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("or sign-in using"),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height*0.05,width: width*0.7,
                  child: Row(
                    children: [
                      Image.asset("assets/Images/apple-logo_747 1.png"),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
