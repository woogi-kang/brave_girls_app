import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed('/home');
    });
    super.onInit();
  }
}