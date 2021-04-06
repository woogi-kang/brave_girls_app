import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayPage extends StatefulWidget {
  final String videoId;

  const YoutubePlayPage({Key? key, required this.videoId}) : super(key: key);

  @override
  _YoutubePlayPageState createState() => _YoutubePlayPageState();
}

class _YoutubePlayPageState extends State<YoutubePlayPage> {
  YoutubePlayerController? youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        disableDragSeek: true,
        autoPlay: true,
        captionLanguage: 'ko',
        forceHD: true,
        mute: false,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: youtubePlayerController!),
        builder: (context, player) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [player],
          );
        },
      ),
    );
  }
}
