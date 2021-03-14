import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed('/home');
    });
    super.onInit();
  }
}