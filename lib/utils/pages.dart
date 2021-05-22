import 'package:brave_girls/ui/albums/albums_page.dart';
import 'package:brave_girls/ui/charts/chart_ranking_page.dart';
import 'package:brave_girls/ui/home_page.dart';
import 'package:brave_girls/ui/member_detail/member_detail.dart';
import 'package:brave_girls/ui/member_detail/youtube_play_page.dart';
import 'package:brave_girls/ui/photo_view_page.dart';
import 'package:brave_girls/ui/schedule/calendar.dart';
import 'package:brave_girls/ui/splash_page.dart';
import 'package:brave_girls/utils/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.home_page,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.member_detail,
      settings: Get.arguments,
      page: () => MemberDetail(
        memberProfile: Get.arguments['memberProfile'],
      ),
    ),
    GetPage(
      name: Routes.photo_view,
      settings: Get.arguments,
      page: () => PhotoViewPage(
        imageUrls: Get.arguments['imageUrls'],
        index: Get.arguments['index'],
      ),
    ),
    GetPage(
      name: Routes.chart,
      page: () => ChartRankingPage(),
    ),
    GetPage(
      name: Routes.album_detail,
      page: () => AlbumsPage(),
    ),
    GetPage(
      name: Routes.calendar,
      page: () => CalendarPage(),
    ),
    GetPage(
      name: Routes.youtube_play_page,
      settings: Get.arguments,
      page: () => YoutubePlayPage(videoId: Get.arguments['videoId']),
    ),
  ];
}
