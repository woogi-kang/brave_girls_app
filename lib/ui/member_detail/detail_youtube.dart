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

                return InkWell(
                  onTap: () async {
                    var url = 'https://youtu.be/${id!.videoId}';
                    await launch(url);
                  },
                  child: Container(
                    height: thumbnail!.high!.height!.toDouble(),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: (thumbnail.high!.url!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                item.snippet!.title!,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 15, letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
