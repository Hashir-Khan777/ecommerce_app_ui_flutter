import 'package:dio/dio.dart';
import 'package:frontend/controllers/product_controller.dart';
import 'package:frontend/models/product_model.dart';
import 'package:get/get.dart';

final productController = Get.find<ProductController>();

class CartController extends GetxController {
  List<ProductModel> cart = [];

  @override
  onInit() {
    getCart();
    super.onInit();
  }

  getCart() async {
    try {
      final response = await Dio().get(
        "http://192.168.0.104:8000/api/cart/",
        options:
            Options(headers: {"token": "Bearer ${productController.user}"}),
      );
      for (var product in response.data) {
        cart.add(ProductModel.fromJson(product));
      }
      update(["cart"]);
    } on DioError catch (err) {
      print(err.message);
    }
  }

  removeFromCart(productId) async {
    try {
      cart = cart.where((element) => element.id != productId).toList();
      await Dio().delete(
        "http://192.168.0.104:8000/api/cart/$productId/",
      );
      update(["cart"]);
      Get.snackbar("Removed from cart", "Product has been removed from cart");
    } on DioError catch (err) {
      print(err.message);
    }
  }
}
