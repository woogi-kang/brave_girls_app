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
                                SizedBox(height: 15),
                                buildSnsButtons(),
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
            SizedBox(height: 10),
            Container(
              child: Image.asset(
                Assets.byunhaeteoAlbumCover,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            _buildTitleTile("소속사"),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  child: Image.asset(
                    Assets.braveEnterLogo,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 70,
                  child: Image.asset(
                    Assets.braveGirlsLogo,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
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

  Widget buildSnsButtons() {
    var link = profileModel!.profile!.link!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
          opacity: link.instagram! != "" ? 1 : 0.3,
          child: Container(
            width: 25,
            height: 25,
            child: InkWell(
              onTap: () async {
                var url = link.instagram;
                await launch(url!);
              },
              child: Image.asset(
                Assets.iconInstagram,
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Opacity(
          opacity: link.youtube! != "" ? 1 : 0.3,
          child: Container(
            width: 25,
            height: 25,
            child: InkWell(
              onTap: () async {
                var url = link.youtube;
                await launch(url!);
              },
              child: Image.asset(
                Assets.iconYoutube,
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Opacity(
          opacity: link.tiktok! != "" ? 1 : 0.3,
          child: Container(
            width: 25,
            height: 25,
            child: InkWell(
              onTap: () async {
                var url = link.tiktok;
                await launch(url!);
              },
              child: Image.asset(
                Assets.iconTiktok,
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Opacity(
          opacity: link.twitter! != "" ? 1 : 0.3,
          child: Container(
            width: 25,
            height: 25,
            child: InkWell(
              onTap: () async {
                var url = link.twitter;
                await launch(url!);
              },
              child: Image.asset(
                Assets.iconTwitter,
              ),
            ),
          ),
        ),
      ],
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
