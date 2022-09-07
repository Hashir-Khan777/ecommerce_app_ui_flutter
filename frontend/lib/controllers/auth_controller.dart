import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:frontend/controllers/product_controller.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/views/home.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> storage = SharedPreferences.getInstance();
final productController = Get.find<ProductController>();

class AuthController extends GetxController {
  signUp(userInfo) async {
    try {
      final response = await Dio().post(
        "http://192.168.0.104:8000/api/users/",
        data: jsonEncode(userInfo),
      );
      UserModel user = UserModel.fromJson(response.data);
      storage.then((prefs) {
        prefs.setString("user", user.token);
        productController.checkToken();
        Get.to(const Home());
      });
    } on DioError catch (err) {
      print(err.message);
    }
  }
}
