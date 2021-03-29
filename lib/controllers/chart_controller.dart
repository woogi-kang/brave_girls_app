import 'package:get/get.dart';
import 'package:web_scraper/web_scraper.dart';

class ChartController extends GetxController {
  List<Map<String, dynamic>> melonChart = [];
  List<Map<String, dynamic>> spotifyChart = [];
  List<Map<String, dynamic>> bugsChart = [];
  List<Map<String, dynamic>> genieChart = [];
  List<Map<String, dynamic>> vibeChart = [];

  bool _isModelReady = false;

  bool get isModelReady => _isModelReady;

  @override
  void onInit() {
    getMelonChart(titles: ["Rollin'", '운전만해']);
    getGenieChart(titles: ["Rollin'", '운전만해']);
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

  void getMelonChart({required List<String?> titles}) async {
    _isModelReady = false;
    update();

    var webScrapper = WebScraper('https://www.melon.com/');
    //일일 차트 크롤링
    //top 1~50 / 51~100 으로 나눠져있음
    if (await webScrapper.loadWebPage('/chart/day/index.htm')) {
      List<Map<String, dynamic>> top50 = webScrapper.getElement('tr.lst50"', ['']);
      List<Map<String, dynamic>> top100 = webScrapper.getElement('tr.lst100"', ['']);

      if (top50.isNotEmpty) {
        int rankNo = 1;
        for (var item in top50) {
          var itemTitle = item['title'].toString().trim();

          titles.forEach((element) {
            if (itemTitle.contains(element!)) {
              melonChart.add({
                'title': element,
                'rank': rankNo,
                'type': 'day',
              });
            }
          });
          ++rankNo;
        }

        if (melonChart.length < titles.length) {
          rankNo = 51;
          for (var item in top100) {
            var itemTitle = item['title'].toString().trim();

            titles.forEach((element) {
              if (itemTitle.contains(element!)) {
                melonChart.add({
                  'title': element,
                  'rank': rankNo,
                  'type': 'day',
                });
              }
            });
            ++rankNo;
          }
        }
      }
    }

    webScrapper = WebScraper('https://www.melon.com/');
    if (await webScrapper.loadWebPage('/chart/week/index.htm')) {
      List<Map<String, dynamic>> top50 = webScrapper.getElement('tr.lst50"', ['']);
      List<Map<String, dynamic>> top100 = webScrapper.getElement('tr.lst100"', ['']);

      int rankNo = 1;

      if (top50.isNotEmpty) {
        for (var item in top50) {
          var itemTitle = item['title'].toString().trim();

          titles.forEach((element) {
            if (itemTitle.contains(element!)) {
              melonChart.add({
                'title': element,
                'rank': rankNo,
                'type': 'week',
              });
            }
          });
          ++rankNo;
        }

        for (var item in top100) {
          var itemTitle = item['title'].toString().trim();

          titles.forEach((element) {
            if (itemTitle.contains(element!)) {
              melonChart.add({
                'title': element,
                'rank': rankNo,
                'type': 'week',
              });
            }
          });
          ++rankNo;
        }
      }
    }
  }

  Future<void> getGenieChart({required List<String?> titles}) async {
    var webScrapper = WebScraper('https://www.genie.co.kr');

    int pageNo = 1;
    int rankNo = 1;

    // 일간 차트
    while (pageNo < 3) {
      if (await webScrapper.loadWebPage('/chart/top200?ditc=D&rtm=N&pg=$pageNo')) {
        List<Map<String, dynamic>> items = webScrapper.getElement('tr.list"', ['']);

        if (items.isNotEmpty) {
          for (var item in items) {
            var itemTitle = item['title'].toString().trim();

            titles.forEach((element) {
              if (itemTitle.contains(element!)) {
                genieChart.add({
                  'title': element,
                  'rank': rankNo,
                  'type': 'day',
                });
              }
            });
            ++rankNo;
          }
        }
      }
      ++pageNo;
    }

    // 주간 차트
    pageNo = 1;
    rankNo = 1;

    while (pageNo < 3) {
      if (await webScrapper.loadWebPage('/chart/top200?ditc=W&rtm=N&pg=$pageNo')) {
        List<Map<String, dynamic>> items = webScrapper.getElement('tr.list"', ['']);

        if (items.isNotEmpty) {
          for (var item in items) {
            var itemTitle = item['title'].toString().trim();

            titles.forEach((element) {
              if (itemTitle.contains(element!)) {
                genieChart.add({
                  'title': element,
                  'rank': rankNo,
                  'type': 'week',
                });
              }
            });
            ++rankNo;
          }
        }
      }
      ++pageNo;
    }

    _isModelReady = true;
    update();
  }
}
