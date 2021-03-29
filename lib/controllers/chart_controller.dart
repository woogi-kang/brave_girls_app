import 'package:get/get.dart';
import 'package:web_scraper/web_scraper.dart';

class ChartController extends GetxController {
  List<Map<String, dynamic>> melonChart = [];
  List<Map<String, dynamic>> bugsChart = [];
  List<Map<String, dynamic>> genieChart = [];
  List<Map<String, dynamic>> spotifyChart = [];

  bool _isModelReady = false;

  bool get isModelReady => _isModelReady;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    await getMelonChart(titles: ["Rollin'", '운전만해']);
    await getGenieChart(titles: ["Rollin'", '운전만해']);
    await getBugsChart(titles: ["Rollin'", '운전만해']);
    await getSpotifyChart(titles: ["Rollin'", 'We Ride']);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getMelonChart({required List<String> titles}) async {
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
            if (itemTitle.contains(element)) {
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
              if (itemTitle.contains(element)) {
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
            if (itemTitle.contains(element)) {
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
            if (itemTitle.contains(element)) {
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

  Future<void> getGenieChart({required List<String> titles}) async {
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
              if (itemTitle.contains(element)) {
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
              if (itemTitle.contains(element)) {
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
  }

  Future<void> getBugsChart({required List<String> titles}) async {
    var webScrapper = WebScraper('https://music.bugs.co.kr/');

    int rankNo = 1;

    // 일간 차트
    if(await webScrapper.loadWebPage("/chart/track/day/total")) {
      List<Map<String, dynamic>> items = webScrapper.getElement('tr"', ['']);

      if(items.isNotEmpty) {
        for (var item in items) {
          var itemTitle = item['title'].toString().trim();

          titles.forEach((element) {
            if (itemTitle.contains(element)) {
              bugsChart.add({
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

    // 주간 차트

    rankNo = 1;

    if(await webScrapper.loadWebPage("/chart/track/week/total")) {
      List<Map<String, dynamic>> items = webScrapper.getElement('tr"', ['']);

      if(items.isNotEmpty) {
        for (var item in items) {
          var itemTitle = item['title'].toString().trim();

          titles.forEach((element) {
            if (itemTitle.contains(element)) {
              bugsChart.add({
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

  Future<void> getSpotifyChart({required List<String> titles}) async {
    var webScrapper = WebScraper("https://spotifycharts.com");

    int rankNo = 1;

    // 일간 차트
    if(await webScrapper.loadWebPage("/regional/kr/daily/latest")) {
      List<Map<String, dynamic>> items = webScrapper.getElement('td.chart-table-track', ['strong']);

      if(items.isNotEmpty) {
        for (var item in items) {
          var itemTitle = item['title'].toString().trim();

          titles.forEach((element) {
            if (itemTitle.contains(element)) {
              spotifyChart.add({
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

    // 주간 차트

    rankNo = 1;

    if(await webScrapper.loadWebPage("/regional/kr/weekly/latest")) {
      List<Map<String, dynamic>> items = webScrapper.getElement('td.chart-table-track', ['strong']);

      if(items.isNotEmpty) {
        for (var item in items) {
          var itemTitle = item['title'].toString().trim();

          titles.forEach((element) {
            if (itemTitle.contains(element)) {
              spotifyChart.add({
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

    _isModelReady = true;
    update();
  }
}
