import 'package:brave_girls/controllers/youtube_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailYoutube extends StatelessWidget {
  final String? query;

  DetailYoutube({Key? key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YoutubeController>(
      init: YoutubeController(query: query),
      builder: (controller) => !controller.isModelReady
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.getModel.items!.length,
              itemBuilder: (_, index) {
                var item = controller.getModel.items![index];
                var id = item.id;
                var thumbnail = item.snippet!.thumbnails;
                var title = item.snippet!.title!;
                title = title.replaceAll('&#39;', '');

                return InkWell(
                  onTap: () async {
                    var url = 'https://youtu.be/${id!.videoId}';
                    await launch(url);
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CachedNetworkImage(
                                  height: thumbnail!.medium!.height!.toDouble(),
                                  imageUrl: (thumbnail.high!.url!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
                                child: Text(
                                  title,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'NotoSansKR Regular',
                                    fontSize: 15,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Divider(),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
