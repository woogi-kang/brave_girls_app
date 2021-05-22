import 'package:brave_girls/constants/colors.dart';
import 'package:brave_girls/controllers/splash_controller.dart';
import 'package:brave_girls/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  late SplashController controller;

  Widget build(BuildContext context) {
    Get.lazyPut(() => SplashController());
    controller = Get.find();

    return GetBuilder<SplashController>(
      builder: (_) =>
          Scaffold(
            backgroundColor: AppColors.darkNavy,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 200,
                    child: Image.asset(
                      Assets.logo,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
    );
  }
}
