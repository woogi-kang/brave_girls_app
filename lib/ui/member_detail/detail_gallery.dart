import 'package:brave_girls/controllers/gallery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailGallery extends StatelessWidget {
  final String? query;
  DetailGallery({Key? key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GalleryController>(
      init: GalleryController(query: query),
      builder: (controller) {
        return SizedBox();
      },
    );
  }
}
