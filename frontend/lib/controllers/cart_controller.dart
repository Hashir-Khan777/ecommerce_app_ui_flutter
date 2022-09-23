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
      update(["cart", "price", "items"]);
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
      update(["cart", "price", "items"]);
      Get.snackbar("Removed from cart", "Product has been removed from cart");
    } on DioError catch (err) {
      print(err.message);
    }
  }

  changeQuantity(int? id, {bool add = true}) {
    ProductModel product = cart.firstWhere((element) => element.id == id);
    if (add) {
      if (product.quantity! < product.stock!) {
        product.quantity = product.quantity! + 1;
      }
      productController.updateProduct(id, product);
      update(["quantity", "price", "items"]);
    } else {
      if (product.quantity! > 1) {
        product.quantity = product.quantity! - 1;
        productController.updateProduct(id, product);
        update(["quantity", "price", "items"]);
      }
    }
  }
}
