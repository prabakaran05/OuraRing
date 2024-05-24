import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class LoginScreenController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
  }

  //
  // login(context) async {
  //   if (userController.value.text.isEmpty ||
  //       userController.text.toString() != 'iniflutter') {
  //     Fluttertoast.showToast(
  //       msg: "Please enter Correct UserName",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.black,
  //       textColor: Colors.white,
  //     );
  //     return;
  //   }
  //   if (passwordController.value.text.isEmpty ||
  //       passwordController.text.toString() != 'ini@ca') {
  //     Fluttertoast.showToast(
  //       msg: "Please enter Correct Password",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.black,
  //       textColor: Colors.white,
  //     );
  //     return;
  //   }
  //   Map<String, dynamic> payload = {
  //     'username': userController.text.toString(),
  //     'password': passwordController.text.toString(),
  //     'request_token': token
  //   };
  //   print('loginPayload:$payload');
  //   var response = await _connect.loginCall(payload);
  //   debugPrint("loginCallResponse: ${response.toJson()}");
  //   if (response != null) {
  //     Fluttertoast.showToast(
  //       msg: 'Login Successfully',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.black,
  //       textColor: Colors.white,
  //     );
  //
  //     // Get.offNamed(AppRoutes.h.toName);
  //
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //     );
  //     passwordController.text = "";
  //     userController.text = "";
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: 'Please Check the Credentials',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //     );
  //   }
  // }
}
