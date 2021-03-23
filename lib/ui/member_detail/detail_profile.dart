import 'package:brave_girls/models/profile_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailProfile extends StatelessWidget {
  final ProfileModel? profileModel;

  DetailProfile({Key? key, this.profileModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          profileModel!.profile!.name!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'NotoSansKR Medium',
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: Center(child: Icon(Icons.add)),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 40,
                              height: 40,
                              child: Center(child: Icon(Icons.add)),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 40,
                              height: 40,
                              child: Center(child: Icon(Icons.add)),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 380,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          profileModel!.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
