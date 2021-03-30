import 'dart:typed_data';

import 'package:brave_girls/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewPage extends StatefulWidget {
  final List<String>? imageUrls;
  final int? index;

  PhotoViewPage({Key? key, this.imageUrls, this.index}) : super(key: key);

  @override
  _PhotoViewPageState createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  PageController _pageController = PageController();

  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index!);
    currentIndex = widget.index!;
    super.initState();
  }

  void onPageChanged(int index) {
    currentIndex = index;
  }

  Future<void> _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();

    Fimber.d(info);
  }

  _getImageAndDownload() async {
    var response = await Dio().get(
      widget.imageUrls![currentIndex],
      options: Options(responseType: ResponseType.bytes),
    );
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));

    Fimber.d('$result');

    if (result['isSuccess'] == true) {
      Fluttertoast.showToast(msg: " 다운로드 완료 ", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
    } else {
      Fluttertoast.showToast(msg: " 다운로드 실패 ", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 16),
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              itemCount: widget.imageUrls!.length,
              pageController: _pageController,
              scrollDirection: Axis.horizontal,
              builder: _buildItem,
              onPageChanged: onPageChanged,
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      await _requestPermission();
                      _getImageAndDownload();
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            color: AppColors.slateBlue,
                            child: Center(
                              child: Text(
                                "다운로드",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'NotoSansKR Regular',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions.customChild(
      child: Container(
        height: 300,
        child: Image.network(
          widget.imageUrls![currentIndex],
          height: 300,
          filterQuality: FilterQuality.high,
        ),
      ),
      childSize: const Size(300, 300),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: index),
    );
  }
}
