import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/models/product_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> storage = SharedPreferences.getInstance();

class ProductController extends GetxController {
  List<String> images = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image1.png'
  ];
  int sliderIndex = 0;
  String? user;
  List<ProductModel> products = [];
  ProductModel? product;

  @override
  onInit() {
    checkToken();
    getAllProducts();
    super.onInit();
  }

  checkToken() {
    storage.then((prefs) {
      user = prefs.getString('user');
      update(["user"]);
    });
  }

  changeSliderIndex(int index) {
    sliderIndex = index;
    update(["slider"]);
  }

  getAllProducts() async {
    try {
      final response =
          await Dio().get("http://192.168.0.104:8000/api/products/");
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      update(["products"]);
    } on DioError catch (err) {
      print(err.message);
    }
  }

  getProductById(int? id) async {
    product = null;
    try {
      final response =
          await Dio().get("http://192.168.0.104:8000/api/products/$id/");
      product = ProductModel.fromJson(response.data);
      update(["Product"]);
    } on DioError catch (err) {
      print(err.message);
    }
  }

  addToCart(int? userId, int? productId) async {
    try {
      await Dio().put(
        "http://192.168.0.104:8000/api/cart/$productId/",
        options: Options(headers: {"token": "Bearer $user"}),
      );
      Get.snackbar("Added to cart", "Product has been added to cart");
    } on DioError catch (err) {
      print(err.message);
    }
  }
}
