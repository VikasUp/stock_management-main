// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:saudi_cars/Resources/const_manager.dart';
// import 'package:saudi_cars/Resources/message_string.dart';
// import 'package:saudi_cars/Resources/utils/app_routes.dart';
// import 'package:saudi_cars/models/model/login_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginController extends GetxController {
//   final user_emailController = TextEditingController().obs;
//   final user_passwordController = TextEditingController().obs;
//   late LoginEmailModel loginEmailModel;
//   RxBool loading = false.obs;
//   bool get isLoggedIn => _isLoggedIn;
//   bool _isLoggedIn = false;
//   String? user_email; 
//   static const String _isLoggedInKey = 'isLoggedIn';

//   Future<void> saveLoginStatus(bool isLoggedIn) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(_isLoggedInKey, isLoggedIn);
//   }

//   Future<bool> getLoginStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(_isLoggedInKey) ?? false;
//   }


//   String? get userEmail => user_email;
//   void loginApi(BuildContext context) async {
//     loading.value = true;
//     try {
//       final response = await http.post(
//         Uri.parse('${Constants.baseUrl}${Constants.login}'),
//         body: {
//           'user_email': user_emailController.value.text,
//           'user_password': user_passwordController.value.text,
//           'api_key': Constants.apiKey,
//         },
//       );
//       print('=====');
//       print(response.statusCode);
//       print('=====');
//       if (response.statusCode == 200) {
//         _isLoggedIn = true;
//         // Save login status
//         await saveLoginStatus(true);

//         loginEmailModel = LoginEmailModel.fromJson(json.decode(response.body));
//         user_email = loginEmailModel.userEmail;

//         // Navigate to dashboard
//         Navigator.pushReplacementNamed(context, AppRoutes.dashBoard);
//       } else {
//         print('Error Response: ${response.body}');
//         Get.snackbar(
//           MessageString.kError,
//           MessageString.kLogErrors,
//           snackPosition: SnackPosition.TOP,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     } catch (e) {
//       print('Exception: $e');
//       Get.snackbar(MessageString.kException, e.toString());
//     } finally {
//       loading.value = false;
//     }
//   }
// }
