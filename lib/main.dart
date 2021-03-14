import 'package:brave_girls/controllers/bindings/authBinding.dart';
import 'package:brave_girls/ui/splash_page.dart';
import 'package:brave_girls/utils/pages.dart';
import 'package:brave_girls/utils/root.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Fimber.plantTree(DebugTree());
  await Firebase.initializeApp();

  runApp(
    Phoenix(
      child: BraveGirlsApp(),
    ),
  );
}

class BraveGirlsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialRoute: '/splash',
      getPages: AppPages.pages,
      initialBinding: AuthBinding(),
      home: SplashPage(),
      theme: ThemeData(),
    );
  }
}
