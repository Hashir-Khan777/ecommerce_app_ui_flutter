import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/constants/color_contants.dart';
import 'package:frontend/widgets/bottomnavigation_widget.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Get.offAll(
        const BottomNavigation(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(ColorConstants.primaryBlue),
        child: Center(
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }
}
