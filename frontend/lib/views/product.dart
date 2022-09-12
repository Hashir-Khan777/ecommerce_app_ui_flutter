import 'package:flutter/material.dart';
import 'package:frontend/constants/color_contants.dart';
import 'package:frontend/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:simple_moment/simple_moment.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      id: "Product",
      init: ProductController(),
      builder: (controller) {
        if (controller.product != null) {
          Moment rawDate = Moment.parse(controller.product?.createdAt ?? "");
          return Scaffold(
            backgroundColor: Color(ColorConstants.primaryWhite),
            appBar: AppBar(
              backgroundColor: Color(ColorConstants.primaryWhite),
              foregroundColor: Color(ColorConstants.primaryBlack),
              elevation: 0,
              title: Text(controller.product?.name ?? ""),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .35,
                        child: Image.network(
                          controller.product?.image ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.product?.name ?? "",
                                  style: TextStyle(
                                    color: Color(ColorConstants.navyBlue),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border),
                                )
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.star_border, size: 20),
                                Icon(Icons.star_border, size: 20),
                                Icon(Icons.star_border, size: 20),
                                Icon(Icons.star_border, size: 20),
                                Icon(Icons.star_border, size: 20),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "\$${controller.product?.price ?? 0}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(
                                    ColorConstants.primaryBlue,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Specifications',
                              style: TextStyle(
                                color: Color(ColorConstants.navyBlue),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "brand:",
                                        style: TextStyle(
                                          color: Color(ColorConstants.navyBlue),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        controller.product?.brand ?? "",
                                        style: TextStyle(
                                          color: Color(
                                              ColorConstants.secondryGrey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "posted At:",
                                          style: TextStyle(
                                            color:
                                                Color(ColorConstants.navyBlue),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Text(
                                          rawDate.format("dd/MM/yyyy"),
                                          style: TextStyle(
                                            color: Color(
                                                ColorConstants.secondryGrey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    controller.product?.description ?? "",
                                    style: TextStyle(
                                      color: Color(ColorConstants.secondryGrey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(ColorConstants.primaryBlue),
                          shadowColor: Color(ColorConstants.primaryBlue),
                          alignment: Alignment.bottomCenter,
                          elevation: 6,
                        ),
                        onPressed: () {
                          controller.addToCart(controller.product?.id);
                        },
                        child: const Center(
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
