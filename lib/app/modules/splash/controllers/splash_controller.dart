import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    // Delay for 3 seconds on the splash screen
    await Future.delayed(Duration(seconds: 3));
    // Navigate to the next screen (e.g., Home or Login)
    Get.offAllNamed('/users-list'); // Replace '/home' with your desired route
  }
}
