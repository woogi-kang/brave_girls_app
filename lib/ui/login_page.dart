import 'package:brave_girls/controllers/authController.dart';
import 'package:brave_girls/ui/signup_page.dart';
import 'package:brave_girls/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                controller: emailController,
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                controller: passwordController,
                obscureText: true,
              ),
              ElevatedButton(
                child: Text("Log In"),
                onPressed: () {
                  controller.login(emailController.text, passwordController.text);
                },
              ),
              ElevatedButton(
                child: Text("Sign In Anonymously"),
                onPressed: () {
                  controller.signInAnonymously();
                  Get.toNamed(Routes.homePage);
                },
              ),
              TextButton(
                child: Text("Sign Up"),
                onPressed: () {
                  Get.to(SignUpPage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
