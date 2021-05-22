import 'dart:convert';

import 'package:brave_girls/constants/keys.dart';
import 'package:brave_girls/constants/urls.dart';
import 'package:brave_girls/models/youtube_list_model.dart';
import 'package:brave_girls/utils/http_utils.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeController extends GetxController {
  final String? query;

  YoutubeController({this.query});

  var scrollController;
  var youtubeModel = YoutubeListModel().obs;

  RxBool isModelReady = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    // called immediately after the widget is allocated memory
    scrollController = ScrollController(initialScrollOffset: 0.0);
    scrollController.addListener(scrollListener);

    await getYoutubeLists(query: query, maxResults: 20);

    super.onInit();
  }

  void scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent - 40) {
      addYoutubeLists();
    }
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  Future<void> getYoutubeLists({String? query, int? maxResults = 20}) async {
    isModelReady = false.obs;
    update();

    String url = Urls.YOUTUBE_API;

    String unencodedPath = '/youtube/v3/search';

    var params = {'maxResults': '$maxResults', 'q': query, 'key': Keys.YOUTUBE_API, 'part': 'snippet', 'type': 'video', 'order': 'viewCount'};

    var result = await HttpUtil().get(url: url, unEncodedPath: unencodedPath, params: params);
    Fimber.d("$query 검색중...");

    youtubeModel = YoutubeListModel.fromJson(jsonDecode(result)).obs;

    isModelReady = true.obs;
    update();
  }

  Future<void> addYoutubeLists({String? query, int? maxResults = 20}) async {
    isLoading = false.obs;
    update();

    String url = Urls.YOUTUBE_API;

    String unencodedPath = '/youtube/v3/search';

    var params = {'maxResults': '$maxResults', 'q': query, 'key': Keys.YOUTUBE_API, 'pageToken': youtubeModel.value.nextPageToken, 'part': 'snippet', 'type': 'video', 'order': 'viewCount'};

    var result = await HttpUtil().get(url: url, unEncodedPath: unencodedPath, params: params);
    var model = YoutubeListModel.fromJson(jsonDecode(result));

    //다음페이지 토큰 갱신
    youtubeModel.value.nextPageToken = model.nextPageToken;
    youtubeModel.value.items!.addAll(model.items!);

    isLoading = true.obs;
    update();
  }
}
