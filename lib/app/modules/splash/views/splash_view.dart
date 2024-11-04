import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profiles/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView {
  SplashView({Key? key}) : super(key: key);

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo or Image
            Image.asset(
              'assets/icon/icon.png', // Update with your logo
              height: 120,
            ),
            const SizedBox(height: 20),
            // App Name
            Text(
              "Profiles App",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
