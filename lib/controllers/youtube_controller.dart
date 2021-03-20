import 'dart:convert';

import 'package:brave_girls/constants/keys.dart';
import 'package:brave_girls/constants/urls.dart';
import 'package:brave_girls/models/youtube_list_model.dart';
import 'package:brave_girls/utils/http_utils.dart';
import 'package:fimber/fimber.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class YoutubeController extends GetxController {
  YoutubeListModel _youtubeModel = YoutubeListModel();
  YoutubeListModel get getModel => _youtubeModel;
  set youtubeModel(YoutubeListModel value) => _youtubeModel = value;

  bool _isModelReady = false;
  bool get isModelReady => _isModelReady;

  @override
  void onInit() async {  // called immediately after the widget is allocated memory
    await fetchApi(query: '브레이브걸스', maxResults: 20);
    super.onInit();
  }

  @override
  void onReady() { // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() { // called just before the Controller is deleted from memory
    super.onClose();
  }

  Future<void> fetchApi({String? query, int? maxResults = 20}) async {
    _isModelReady = false;
    update();

    String url = Urls.YOUTUBE_API;

    String unencodedPath = '/youtube/v3/search';

    var params = {
      'maxResults': '$maxResults',
      'q': query,
      'key': Keys.YOUTUBE_API,
      'part': 'snippet',
      'type': 'video',
    };

    var result = await HttpUtil().get(url: url, unEncodedPath: unencodedPath, params: params);

    _youtubeModel = YoutubeListModel.fromJson(jsonDecode(result));

    _isModelReady = true;
    update();
  }

  void clear() {
    _youtubeModel = YoutubeListModel();
  }
}