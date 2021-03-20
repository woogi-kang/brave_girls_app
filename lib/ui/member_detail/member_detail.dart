import 'package:brave_girls/constants/colors.dart';
import 'package:brave_girls/controllers/youtube_controller.dart';
import 'package:brave_girls/ui/member_detail/detail_youtube.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberDetail extends StatelessWidget {
  final String? memberName;

  const MemberDetail({Key? key, this.memberName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.darkSlateBlue,
          elevation: 0,
          bottom: TabBar(
              labelColor: AppColors.slateBlue,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("정보"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("갤러리"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("관련영상"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("응애응"),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("$memberName")),
            Icon(Icons.movie),
            DetailYoutube(),
            Icon(Icons.games),
          ],
        ),
      ),
    );
  }
}
