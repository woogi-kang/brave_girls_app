import 'dart:ui';

import 'package:brave_girls/constants/profiles.dart';
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
                  padding: const EdgeInsets.only(bottom: 100),
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
          ],
        ),
      ),
    );
  }

  Widget buildImage(ProfileModel? memberProfile) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.member_detail, arguments: {
          "memberProfile" : memberProfile!
        });
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
}
