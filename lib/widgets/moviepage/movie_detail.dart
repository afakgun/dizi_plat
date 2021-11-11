import 'package:dizi_plat/controller/movie_controller.dart';
import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/model/trailer.dart';
import 'package:dizi_plat/model/video.dart';
import 'package:dizi_plat/widgets/detailpage_widgets/detail_actors.dart';
import 'package:dizi_plat/widgets/detailpage_widgets/detail_overview.dart';
import 'package:dizi_plat/widgets/detailpage_widgets/detail_poster.dart';
import 'package:dizi_plat/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetail extends StatefulWidget {
  MovieDetail({
    Key? key,
    movie,
  }) : super(key: key);

  Movie movie = Movie();

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late YoutubePlayerController _controller;
  MovieController movieController = Get.put(MovieController());
  Movie movie = Movie();

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'gU4vcJIbeOU',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF17162e)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFF17162e)),
              height: Get.height * 1.5,
              child: Stack(
                children: <Widget>[
                  DetailPoster(),
                  DetailOverview(),
                  playTrailer(),
                  DetailActors(),
                ],
              ),
              // Center(
              //     child: YoutubePlayer(
              //   controller: _controller,
              //   showVideoProgressIndicator: true,
              //   onReady: () {
              //     print('Player is ready.');
              //   },
              // )),
            ),
          ),
        ),
      ),
    );
  }

  Positioned playTrailer() {
    return Positioned(
        top: Get.height * 0.19,
        left: Get.width * 0.8,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF272DDA),
          onPressed: () {
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                print('Player is ready.');
              },
            );
          },
          child: const Icon(Icons.play_arrow),
        ));
  }

  Widget _buildVideoWidget(VideoResponse data) {
    List<Video> videos = data.videos;
    return FloatingActionButton(
      onPressed: () {
        Get.to(VideoPlayerScreen(
            controller: YoutubePlayerController(
                initialVideoId: videos[2].key,
                flags: const YoutubePlayerFlags(
                  autoPlay: true,
                ))));
      },
      backgroundColor: Colors.blueGrey,
      child: const Icon(Icons.play_arrow),
    );
  }
}
