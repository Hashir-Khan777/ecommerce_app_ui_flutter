import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/color_contants.dart';
import 'package:frontend/widgets/card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int sliderIndex = 0;
  List<String> images = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image1.png'
  ];
  final Future<SharedPreferences> storageInstance =
      SharedPreferences.getInstance();
  String? user;

  @override
  void initState() {
    super.initState();
    storageInstance.then(
      (SharedPreferences prefs) => user = prefs.getString("user"),
    );
  }

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
        actions: user != null
            ? [
                Row(
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
                ),
              ]
            : [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.login_outlined,
                    color: Color(ColorConstants.primaryGrey),
                    size: 30,
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
                  CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        onPageChanged: (index, reson) {
                          setState(() {
                            sliderIndex = index;
                          });
                        }),
                    items: images.map((i) {
                      return Image.asset(
                        i,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      );
                    }).toList(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    height: 11,
                    child: ListView.builder(
                      itemCount: images.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 11,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: index == sliderIndex
                                ? Color(ColorConstants.primaryBlue)
                                : Color(ColorConstants.primaryGrey)
                                    .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        );
                      },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customCard(
                    context,
                    image: "assets/image1.png",
                    name: "Product 1",
                    price: "400",
                  ),
                  customCard(
                    context,
                    image: "assets/image1.png",
                    name: "Product 1",
                    price: "400",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
