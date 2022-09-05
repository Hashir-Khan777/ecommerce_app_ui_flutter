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

  @override
  onInit() {
    storage.then((prefs) {
      user = prefs.getString('user');
      update(["user"]);
    });
    getAllProducts();
    super.onInit();
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
}
