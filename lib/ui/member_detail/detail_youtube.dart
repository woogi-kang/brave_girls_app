import 'package:brave_girls/controllers/youtube_controller.dart';
import 'package:brave_girls/utils/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailYoutube extends StatelessWidget {
  final String? query;

  DetailYoutube({Key? key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YoutubeController>(
      init: YoutubeController(query: query),
      builder: (controller) => Obx(
        () => !controller.isModelReady.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                    controller.addYoutubeLists(query: query);
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.youtubeModel.value.items!.length + 1,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    if (index == controller.youtubeModel.value.items!.length) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return buildYoutubeItem(controller, index);
                  },
                ),
              ),
      ),
    );
  }

  Widget buildYoutubeItem(YoutubeController controller, int index) {
    var item = controller.youtubeModel.value.items![index];
    var id = item.id;
    var thumbnail = item.snippet!.thumbnails;
    var title = item.snippet!.title!;
    title = title.replaceAll('&#39;', '');

    return GestureDetector(
      onTap: () async {
        Get.toNamed(Routes.youtube_play_page, arguments: {'videoId': id!.videoId});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: CachedNetworkImage(
                        height: thumbnail!.medium!.height!.toDouble(),
                        imageUrl: (thumbnail.high!.url!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border.all(color: const Color(0xffffffff), width: 1),
                  boxShadow: [BoxShadow(color: const Color(0x29000000), offset: Offset(0, 3), blurRadius: 6, spreadRadius: 0)],
                  color: const Color(0xffffffff)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
