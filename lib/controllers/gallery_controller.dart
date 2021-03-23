import 'package:fimber/fimber.dart';
import 'package:get/get.dart';
import 'package:web_scraper/web_scraper.dart';

class GalleryController extends GetxController {
  final String? query;
  GalleryController({this.query});

  List<String>? _imagesPath;

  @override
  Future<void> onInit() async {
    final webScrapper = WebScraper('https://www.google.com');
    if(await webScrapper.loadWebPage('/search?q=브레이브걸스&rlz=1C5CHFA_enKR942KR942&sxsrf=ALeKk02s7hC_gUksKF-q3y6EKCmrnv8Jww:1616464842429&source=lnms&tbm=isch&sa=X&ved=2ahUKEwituOXlqMXvAhUCMN4KHYyRC0EQ_AUoAXoECAEQAw&biw=1920&bih=976')) {
      List<Map<String, dynamic>> images = webScrapper.getElement('img"', ['src']);
    }
  }

  @override
  void onReady() {

  }

  @override
  void onClose() {

  }
}