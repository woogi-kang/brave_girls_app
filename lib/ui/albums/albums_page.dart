import 'package:brave_girls/constants/colors.dart';
import 'package:brave_girls/constants/constants.dart';
import 'package:brave_girls/models/album_model.dart';
import 'package:flutter/material.dart';

class AlbumsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkSlateBlue,
        title: Text("앨범 정보"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: albums.map((album) => buildAlbums(album: album)).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildAlbums({required AlbumModel album}) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 5, 16, 0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    album!.albumCoverUrl!,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(album.title!),
                    Text(
                      album.artist!,
                    ),
                    Text(
                      '평점: ${album.reviewScore!}',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: AppColors.darkSlateBlue,
                    onPressed: () {
                    },
                  )
                ],
              )
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
