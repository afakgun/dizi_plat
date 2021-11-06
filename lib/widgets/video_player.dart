import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoPlayerScreen extends StatefulWidget {
  final YoutubePlayerController controller;
  const VideoPlayerScreen({ Key? key, required this.controller}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(controller);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  final YoutubePlayerController controller;
  _VideoPlayerScreenState(this.controller);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Center(
              child: YoutubePlayer(
                controller: controller,
              ),
            ),
            Positioned(
              top: 40.0,
              right: 20.0,
              child: IconButton(
                icon: const Icon(EvaIcons.closeCircle),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                  SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitUp]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}