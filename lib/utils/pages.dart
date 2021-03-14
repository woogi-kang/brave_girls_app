import 'package:brave_girls/ui/home_page.dart';
import 'package:brave_girls/ui/splash_page.dart';
import 'package:brave_girls/utils/root.dart';
import 'package:brave_girls/utils/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.initial,
      page: () => Root(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
    ),
  ];
}
