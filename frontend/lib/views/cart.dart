import 'package:flutter/material.dart';
import 'package:frontend/constants/color_contants.dart';
import 'package:frontend/controllers/cart_controller.dart';
import 'package:frontend/controllers/product_controller.dart';
import 'package:frontend/views/product.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Scaffold(
      backgroundColor: Color(ColorConstants.primaryWhite),
      appBar: AppBar(
        backgroundColor: Color(ColorConstants.primaryWhite),
        foregroundColor: Color(ColorConstants.primaryBlack),
        elevation: 0,
        title: Text(
          "Your Cart",
          style: TextStyle(
            color: Color(ColorConstants.navyBlue),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<CartController>(
                id: "cart",
                init: CartController(),
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.cart.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          productController
                              .getProductById(controller.cart[index].id);
                          Get.to(const ProductDetails());
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          padding: const EdgeInsets.all(6),
                          width: MediaQuery.of(context).size.width,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(ColorConstants.primaryGrey),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.only(right: 10),
                                child: Image.network(
                                  controller.cart[index].image ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.cart[index].name ?? "",
                                          style: TextStyle(
                                            color:
                                                Color(ColorConstants.navyBlue),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: const Icon(
                                                Icons.favorite_border,
                                                size: 23,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.removeFromCart(
                                                  controller.cart[index].id,
                                                );
                                              },
                                              child: const Icon(
                                                Icons.delete_outlined,
                                                size: 23,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "\$${controller.cart[index].price}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Color(
                                              ColorConstants.primaryBlue,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 25,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      const Color(0xffEBF0FF),
                                                ),
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller.changeQuantity(
                                                    controller.cart[index].id,
                                                    add: false,
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.remove_outlined,
                                                  size: 19,
                                                ),
                                              ),
                                            ),
                                            GetBuilder<CartController>(
                                              id: "quantity",
                                              builder: (context) {
                                                return Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 3,
                                                  ),
                                                  color:
                                                      const Color(0xffEBF0FF),
                                                  width: 35,
                                                  child: Center(
                                                    child: Text(
                                                      "${controller.cart[index].quantity}",
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xff223263),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            Container(
                                              width: 25,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color:
                                                      const Color(0xffEBF0FF),
                                                ),
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller.changeQuantity(
                                                    controller.cart[index].id,
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.add_outlined,
                                                  size: 19,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(ColorConstants.primaryGrey),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Items '),
                      GetBuilder<CartController>(
                        id: "items",
                        builder: (controller) {
                          return Text("(${controller.cart.length}):");
                        },
                      ),
                      GetBuilder<CartController>(
                        id: "price",
                        builder: (controller) {
                          int totalPrice = controller.cart.fold(
                            0,
                            (previousValue, element) =>
                                (previousValue + element.price!) *
                                element.quantity!,
                          );
                          return Text("\$$totalPrice");
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Checkout",
                      style: TextStyle(fontSize: 13),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
