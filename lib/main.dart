import 'package:brave_girls/controllers/bindings/initialBinding.dart';
import 'package:brave_girls/ui/splash_page.dart';
import 'package:brave_girls/utils/fimber_helper.dart';
import 'package:brave_girls/utils/pages.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var defaultFormat = AssertFormattedTree();

  Fimber.plantTree(defaultFormat);
  await Firebase.initializeApp();

  initializeDateFormatting("ko").then((_) => runApp(
    Phoenix(
      child: BraveGirlsApp(),
    ),
  ));
}

class BraveGirlsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialRoute: '/splash',
      getPages: AppPages.pages,
      initialBinding: InitialBinding(),
      home: SplashPage(),
      theme: ThemeData(
        fontFamily: 'NotoSansKR Regular'
      ),
    );
  }
}
