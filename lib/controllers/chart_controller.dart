import 'package:get/get.dart';
import 'package:web_scraper/web_scraper.dart';

class ChartController extends GetxController {
  // final String? query;
  //
  // ChartController(this.query);

  List<Map<String, dynamic>> melonChart = [];
  List<Map<String, dynamic>> spotifyChart = [];
  List<Map<String, dynamic>> bugsChart = [];
  List<Map<String, dynamic>> genieChart = [];
  List<Map<String, dynamic>> vibeChart = [];

  bool _isModelReady = false;
  bool get isModelReady => _isModelReady;

  @override
  void onInit() {
    getMelonChart();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getMelonChart() async {
    _isModelReady = false;
    update();

    var webScrapper = WebScraper('https://www.melon.com/');
    if(await webScrapper.loadWebPage('/chart/day/index.htm')) {
      List<Map<String, dynamic>> top50 = webScrapper.getElement('tr.lst50"', ['']);
      List<Map<String, dynamic>> top100 = webScrapper.getElement('tr.lst100"', ['']);

      bool top50DayFound = false;

      if(top50.isNotEmpty) {
        int i = 1;
        for(var item in top50) {
          if(item['title'].toString().trim().contains('Rollin')) {
            melonChart.add({
              'rank' : i,
              'type' : 'day',
            });
            top50DayFound = true;
            break;
          }
          ++i;
        }

        if(top50DayFound == false) {
          i = 51;
          for(var item in top100) {
            if(item['title'].toString().trim().contains('Rollin')) {
              melonChart.add({
                'rank' : i,
                'type' : 'day',
              });
              break;
            }
            ++i;
          }
        }

        i = 1;
        for(var item in top50) {
          if(item['title'].toString().trim().contains('운전만해')) {
            melonChart.add({
              'rank' : i,
              'type' : 'day',
            });
            break;
          }
          ++i;
        }
      }
    }

    webScrapper = WebScraper('https://www.melon.com/');
    if(await webScrapper.loadWebPage('/chart/week/index.htm')) {
      List<Map<String, dynamic>> items = webScrapper.getElement('tr.lst50"', ['']);

      if(items.isNotEmpty) {
        int i = 1;
        for(var item in items) {
          if(item['title'].toString().trim().contains('Rollin')) {
            melonChart.add({
              'rank' : i,
              'type' : 'week',
            });
            break;
          }
          ++i;
        }

        i = 1;
        for(var item in items) {
          if(item['title'].toString().trim().contains('운전만해')) {
            melonChart.add({
              'rank' : i,
              'type' : 'week',
            });
            break;
          }
          ++i;
        }
      }
    }



    _isModelReady = true;
    update();
  }

}