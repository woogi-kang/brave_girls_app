import 'package:brave_girls/constants/colors.dart';
import 'package:brave_girls/models/profile_model.dart';
import 'package:brave_girls/ui/member_detail/detail_gallery.dart';
import 'package:brave_girls/ui/member_detail/detail_profile.dart';
import 'package:brave_girls/ui/member_detail/detail_wiki.dart';
import 'package:brave_girls/ui/member_detail/detail_youtube.dart';
import 'package:flutter/material.dart';

class MemberDetail extends StatelessWidget {
  final ProfileModel? memberProfile;

  const MemberDetail({Key? key, this.memberProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var query = memberProfile!.memberName!;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(memberProfile!.memberName!),
          centerTitle: false,
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
                    child: Text("기타"),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            DetailProfile(profileModel: memberProfile),
            DetailGallery(query: query),
            DetailYoutube(query: query),
            DetailWiki(),
          ],
        ),
      ),
    );
  }
}
