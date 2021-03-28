import 'package:brave_girls/controllers/gallery_controller.dart';
import 'package:brave_girls/utils/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailGallery extends StatelessWidget {
  final String? query;

  DetailGallery({Key? key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GalleryController>(
      init: GalleryController(query: query!+" 셀카"),
      builder: (controller) {
        return !controller.isModelReady
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: controller.imagesPath!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return buildItem(controller, index);
                },
              );
      },
    );
  }

  Widget buildItem(GalleryController controller, int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.photo_view, arguments: { 'imageUrls': controller.imagesPath!, 'index': index});
      },
      child: Container(
        width: 80,
        height: 80,
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            imageUrl: controller.imagesPath![index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
