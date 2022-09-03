import 'package:flutter/material.dart';
import 'package:frontend/views/splash.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Ecommerce App',
      home: Splash(),
    );
  }
}
