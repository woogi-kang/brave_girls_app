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
    getMelonChart(title: 'Rollin');
    getMelonChart(title: '운전만해');
    //getGenieChart(title: 'Memories');
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

  void getMelonChart({String? title}) async {
    _isModelReady = false;
    update();

    var webScrapper = WebScraper('https://www.melon.com/');
    //일일 차트 크롤링
    //top 1~50 / 51~100 으로 나눠져있음
    if(await webScrapper.loadWebPage('/chart/day/index.htm')) {
      List<Map<String, dynamic>> top50 = webScrapper.getElement('tr.lst50"', ['']);
      List<Map<String, dynamic>> top100 = webScrapper.getElement('tr.lst100"', ['']);

      bool top50DayFound = false;

      if(top50.isNotEmpty) {
        int i = 1;
        for(var item in top50) {
          if(item['title'].toString().trim().contains(title!)) {
            melonChart.add({
              'title': title,
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
            if(item['title'].toString().trim().contains(title!)) {
              melonChart.add({
                'title': title,
                'rank' : i,
                'type' : 'day',
              });
              break;
            }
            ++i;
          }
        }
      }
    }

    webScrapper = WebScraper('https://www.melon.com/');
    if(await webScrapper.loadWebPage('/chart/week/index.htm')) {
      List<Map<String, dynamic>> items = webScrapper.getElement('tr.lst50"', ['']);

      bool isFound = false;

      if(items.isNotEmpty) {
        int i = 1;
        for(var item in items) {
          if(item['title'].toString().trim().contains(title!)) {
            melonChart.add({
              'title': title,
              'rank' : i,
              'type' : 'week',
            });
            isFound = true;
            break;
          }
          ++i;
        }

        if(!isFound){
          int i = 51;
          for(var item in items) {
            if(item['title'].toString().trim().contains(title!)) {
              melonChart.add({
                'title': title,
                'rank' : i,
                'type' : 'week',
              });
              isFound = true;
              break;
            }
            ++i;
          }
        }
      }
    }
  }

  Future<void> getGenieChart({String? title, bool? last}) async {
    var webScrapper = WebScraper('https://www.genie.co.kr');

    bool pageIterator = true;
    int page = 1;

    int i = 1;
    // 페이지가 나눠져있음 1~50/ 50~100 까지만 찾음
    while(pageIterator) {
      if(await webScrapper.loadWebPage('/chart/top200?ditc=D&rtm=N&pg=$page')) {
        List<Map<String, dynamic>> items = webScrapper.getElement('tr.list"', ['']);

        if(items.isNotEmpty) {
          for (var item in items) {
            var _title = item['title'].toString().trim().contains("Rollin'");
            if (_title) {
              melonChart.add({
                'title': title,
                'rank': i,
                'type': 'day',
              });
              pageIterator = true;
              break;
            }
            ++i;
          }
        }
      }
    }

    _isModelReady = true;
    update();
  }
}