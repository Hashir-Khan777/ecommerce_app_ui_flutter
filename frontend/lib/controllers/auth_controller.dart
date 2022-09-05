import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var user;

  signUp({
    required String fullname,
    required String gender,
    required String image,
    required String email,
    required String password,
  }) async {
    try {
      final response = await Dio().post(
        "http://192.168.0.104:8000/api/users/",
        data: jsonEncode(
          {
            "name": fullname,
            "email": email,
            "password": password,
          },
        ),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      // for (var product in response.data) {
      //   products.add(ProductModel.fromJson(product));
      // }
      update(["products"]);
    } on DioError catch (err) {
      print(err.message);
    }
  }
}
