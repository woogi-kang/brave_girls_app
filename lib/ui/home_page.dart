import 'dart:ui';

import 'package:brave_girls/constants/colors.dart';
import 'package:brave_girls/constants/constants.dart';
import 'package:brave_girls/controllers/auth_controller.dart';
import 'package:brave_girls/models/profile_model.dart';
import 'package:brave_girls/resources/resources.dart';
import 'package:brave_girls/utils/routes.dart';
import 'package:brave_girls/utils/ui_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    UISizeConfig.init(context);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.asset(
              Assets.werideAlbumCover,
              fit: BoxFit.fitHeight,
            ),
            Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(0.1)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildImage(memberProfiles[0]),
                      buildImage(memberProfiles[1]),
                      buildImage(memberProfiles[2]),
                      buildImage(memberProfiles[3]),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 50,
              right: 10,
              child: buildMenu(),
            ),
          ],
        ),
      ),
    );
  }

  _onSelected(String? item) {
    Get.toNamed(Routes.chart);
  }

  Widget buildImage(ProfileModel? memberProfile) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.member_detail, arguments: {"memberProfile": memberProfile!});
      },
      child: Container(
        width: 80.s,
        height: 200.s,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.s),
          child: Image.asset(
            memberProfile!.image!,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color.fromARGB(255, 221, 221, 221)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      itemBuilder: (context) => menus.map((item) => PopupMenuItem<String>(value: item, child: Text(item))).toList(),
      child: Icon(
        Icons.menu,
        color: AppColors.darkNavy,
        size: 40,
      ),
      onSelected: (value) {
        if (value == "음원 순위") {
          Get.toNamed(Routes.chart);
        } else if (value == "앨범 정보") {
          Get.toNamed(Routes.album_detail);
        }
      },
      onCanceled: () {
        return;
      },
    );
  }
}
