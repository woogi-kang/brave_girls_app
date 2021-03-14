import 'package:brave_girls/controllers/authController.dart';
import 'package:brave_girls/controllers/userController.dart';
import 'package:brave_girls/ui/home_page.dart';
import 'package:brave_girls/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  var _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    if(_authController!.user != null) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}