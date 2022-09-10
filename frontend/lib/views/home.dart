import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/color_contants.dart';
import 'package:frontend/controllers/product_controller.dart';
import 'package:frontend/views/login.dart';
import 'package:frontend/views/product.dart';
import 'package:frontend/widgets/card_widget.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorConstants.primaryWhite),
      appBar: AppBar(
        leadingWidth: 0,
        backgroundColor: Color(ColorConstants.primaryWhite),
        elevation: 0,
        titleSpacing: 10,
        toolbarHeight: 80.0,
        shape: Border(
          bottom: BorderSide(
            color: Color(ColorConstants.primaryGrey),
          ),
        ),
        title: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 0,
              right: 10,
              left: 0,
              bottom: 0,
            ),
            hintText: "Search Product",
            hintStyle: TextStyle(
              color: Color(ColorConstants.primaryGrey),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Color(ColorConstants.primaryBlue),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(ColorConstants.primaryGrey),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(ColorConstants.primaryGrey),
              ),
            ),
          ),
        ),
        actions: [
          GetBuilder<ProductController>(
            id: "user",
            builder: (controller) => controller.user != null
                ? Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline,
                          color: Color(ColorConstants.primaryGrey),
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_outlined,
                          color: Color(ColorConstants.primaryGrey),
                          size: 30,
                        ),
                      ),
                    ],
                  )
                : IconButton(
                    onPressed: () => Get.to(const Login()),
                    icon: Icon(
                      Icons.login_outlined,
                      color: Color(ColorConstants.primaryGrey),
                      size: 30,
                    ),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GetBuilder<ProductController>(
                    init: ProductController(),
                    builder: (controller) => CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        onPageChanged: (index, reson) {
                          controller.changeSliderIndex(index);
                        },
                      ),
                      items: controller.images.map((i) {
                        return Image.asset(
                          i,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        );
                      }).toList(),
                    ),
                  ),
                  GetBuilder<ProductController>(
                    id: "slider",
                    builder: (controller) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 11,
                      child: ListView.builder(
                        itemCount: controller.images.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 11,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: index == controller.sliderIndex
                                  ? Color(ColorConstants.primaryBlue)
                                  : Color(ColorConstants.primaryGrey)
                                      .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: const Text(
                  "Products",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              GetBuilder<ProductController>(
                id: "products",
                builder: (controller) {
                  if (controller.products.isNotEmpty) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        mainAxisExtent: 262,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller
                                .getProductById(controller.products[index].id);
                            Get.to(const ProductDetails());
                          },
                          child: customCard(
                            context,
                            image: controller.products[index].image ?? "",
                            name: controller.products[index].name ?? "",
                            price: "${controller.products[index].price}",
                            addToCart: () => controller.addToCart(
                                25, controller.products[index].id),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
