import 'package:flutter/material.dart';
import 'package:frontend/constants/color_contants.dart';
import 'package:frontend/views/account.dart';
import 'package:frontend/views/cart.dart';
import 'package:frontend/views/explore.dart';
import 'package:frontend/views/home.dart';
import 'package:frontend/views/offer.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentTab = 0;
  List<Widget> screens = [
    const Home(),
    const Explore(),
    const Cart(),
    const Offer(),
    const Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTab],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * .075,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Color(ColorConstants.primaryGrey),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  currentTab = 0;
                });
              },
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: currentTab == 0
                        ? Color(ColorConstants.primaryBlue)
                        : Color(ColorConstants.primaryGrey).withOpacity(0.5),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 11,
                      color: currentTab == 0
                          ? Color(ColorConstants.primaryBlue)
                          : Color(ColorConstants.primaryGrey).withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  currentTab = 1;
                });
              },
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_outlined,
                    color: currentTab == 1
                        ? Color(ColorConstants.primaryBlue)
                        : Color(ColorConstants.primaryGrey).withOpacity(0.5),
                  ),
                  Text(
                    "Explore",
                    style: TextStyle(
                      fontSize: 11,
                      color: currentTab == 1
                          ? Color(ColorConstants.primaryBlue)
                          : Color(ColorConstants.primaryGrey).withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  currentTab = 2;
                });
              },
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: currentTab == 2
                        ? Color(ColorConstants.primaryBlue)
                        : Color(ColorConstants.primaryGrey).withOpacity(0.5),
                  ),
                  Text(
                    "Cart",
                    style: TextStyle(
                      fontSize: 11,
                      color: currentTab == 2
                          ? Color(ColorConstants.primaryBlue)
                          : Color(ColorConstants.primaryGrey).withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  currentTab = 3;
                });
              },
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_offer_outlined,
                    color: currentTab == 3
                        ? Color(ColorConstants.primaryBlue)
                        : Color(ColorConstants.primaryGrey).withOpacity(0.5),
                  ),
                  Text(
                    "Offer",
                    style: TextStyle(
                      fontSize: 11,
                      color: currentTab == 3
                          ? Color(ColorConstants.primaryBlue)
                          : Color(ColorConstants.primaryGrey).withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  currentTab = 4;
                });
              },
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_outline,
                    color: currentTab == 4
                        ? Color(ColorConstants.primaryBlue)
                        : Color(ColorConstants.primaryGrey).withOpacity(0.5),
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 11,
                      color: currentTab == 4
                          ? Color(ColorConstants.primaryBlue)
                          : Color(ColorConstants.primaryGrey).withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
