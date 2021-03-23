import 'package:brave_girls/constants/colors.dart';
import 'package:brave_girls/models/member_model.dart';
import 'package:flutter/material.dart';

class MemberDetail extends StatelessWidget {
  final String? memberName;

  const MemberDetail({Key? key, this.memberName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final member = {
      "MinYoung": () => MinYoung(),
      "YouJoung": () => YouJoung(),
      "EunJi": () => EunJi(),
      "Yuna": () => Yuna(),
    }[memberName]!();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.slateBlue,
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
            _MemberInfo(member: member),
            Icon(Icons.movie),
            Icon(Icons.games),
            Icon(Icons.games),
          ],
        ),
      ),
    );
  }
}

class _MemberInfo extends StatelessWidget {
  const _MemberInfo({Key? key, this.member}) : super(key: key);

  final Member? member;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(member!.imageFile!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: AppColors.darkNavy)),
              child: Column(
                children: [
                  _buildRowData("이름", member!.name),
                  _buildRowData("학력", member!.education),
                  _buildRowData("신체", member!.physical),
                  _buildRowData("데뷔", member!.debut),
                  _buildRowData("포지션", member!.position),
                  _buildRowData("MBTI", member!.mbti),
                  _buildRowData("별명", member!.nickname),
                  _buildRowData("특기", member!.speciality),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildRowData(String? title, String? content) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.pink,
                    border: Border(
                        bottom: BorderSide(color: Colors.transparent),
                        right: BorderSide(color: Colors.transparent))),
                child: Center(child: Text(title!)),
              )),
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.transparent))),
                child: Center(child: Text(content!)),
              )),
        ],
      ),
    );
  }
}
