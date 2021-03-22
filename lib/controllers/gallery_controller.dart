import 'package:fimber/fimber.dart';
import 'package:get/get.dart';
import 'package:web_scraper/web_scraper.dart';

class GalleryController extends GetxController {
  final String? query;
  GalleryController({this.query});

  List<Map<String,dynamic>>? _imagesPath;

  @override
  Future<void> onInit() async {
    final webScrapper = WebScraper('https://www.naver.com');
    if(await webScrapper.loadWebPage('/search.naver?where=image&sm=tab_jum&query=$query')) {
    }
  }

  @override
  void onReady() {

  }

  @override
  void onClose() {

  }
}