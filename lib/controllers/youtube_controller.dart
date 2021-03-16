import 'package:brave_girls/models/youtube_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class YoutubeController extends GetxController {
  Rx<YoutubeModel> _youtubeModel = YoutubeModel().obs;

  YoutubeModel get user => _youtubeModel.value!;

  set youtubeModel(YoutubeModel value) => _youtubeModel.value = value;

  void clear() {
    _youtubeModel.value = YoutubeModel();
  }
}