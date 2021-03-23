import 'package:brave_girls/constants/colors.dart';
import 'package:brave_girls/models/profile_model.dart';
import 'package:brave_girls/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailProfile extends StatelessWidget {
  final ProfileModel? profileModel;

  DetailProfile({Key? key, this.profileModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                profileModel!.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profileModel!.profile!.name_ko!,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'NotoSansKR Medium',
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  profileModel!.profile!.name_en!,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'NotoSansKR Medium',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  profileModel!.profile!.position!,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'NotoSansKR Medium',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  profileModel!.profile!.height!,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'NotoSansKR Medium',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  profileModel!.profile!.birth!,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'NotoSansKR Medium',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  profileModel!.profile!.blood!,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'NotoSansKR Medium',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  profileModel!.profile!.country!,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'NotoSansKR Medium',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "MBTI: ${profileModel!.profile!.mbti!}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'NotoSansKR Medium',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      child: InkWell(
                                        onTap: () async {
                                          var url = profileModel!.profile!.link!.instagram;
                                          await launch(url!);
                                        },
                                        child: Image.asset(
                                          Assets.iconInstagram,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      child: InkWell(
                                        onTap: () async {
                                          var url = profileModel!.profile!.link!.tiktok;
                                          await launch(url!);
                                        },
                                        child: Image.asset(
                                          Assets.iconTiktok,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      child: InkWell(
                                        onTap: () async {
                                          var url = profileModel!.profile!.link!.twitter;
                                          await launch(url!);
                                        },
                                        child: Image.asset(
                                          Assets.iconTwitter,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      child: InkWell(
                                        onTap: () async {
                                          var url = profileModel!.profile!.link!.youtube;
                                          await launch(url!);
                                        },
                                        child: Image.asset(
                                          Assets.iconYoutube,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            _buildTitleTile("데뷔"),
            _buildTileContent(profileModel!.profile!.debut!),
            SizedBox(height: 20),
            _buildTitleTile("소속사"),
            _buildTileContent(profileModel!.profile!.agency!),
            SizedBox(height: 20),
            _buildTitleTile("특기"),
            _buildTileListContent(profileModel!.profile!.ability),
            SizedBox(height: 20),
            _buildTitleTile("별명"),
            _buildTileListContent(profileModel!.profile!.nicknames),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleTile(String? title) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.darkSlateBlue,
            ),
            child: Center(
              child: Text(
                title!,
                style: TextStyle(
                  fontFamily: 'NotoSansKR Bold',
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTileContent(String? content) {
    return Container(
      margin: const EdgeInsets.only(top: 15, right: 10),
      child: Text(
        content!,
        style: TextStyle(
          fontFamily: 'NotoSansKR Regular',
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildTileListContent(List<String>? content) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 20,
        children: content!.map((item) => _buildTileContent(item)).toList(),
      ),
    );
  }
}
