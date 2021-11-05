import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'gU4vcJIbeOU',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xF5810000)),
          height: Get.height * 1.5,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Center(
                    child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    print('Player is ready.');
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
