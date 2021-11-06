import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/model/trailer.dart';
import 'package:dizi_plat/model/video.dart';
import 'package:dizi_plat/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;
  MovieDetail({Key? key, required this.movie}) : super(key: key);

  Movie title = Movie();

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
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: const Image(
                          image: NetworkImage(
                              "https://static2.srcdn.com/wordpress/wp-content/uploads/2021/08/New-Venom-2-Poster-Header.jpg")),
                    ),
                  ),
                  Positioned(
                    top: Get.height * 0.22,
                    right: Get.width * 0.025,
                    left: Get.width * 0.025,
                    child: Container(
                      height: Get.height * 0.4,
                      child: Card(
                        color: Color(0xff1d1c3b),
                        child: Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.02),
                          child: const ListTile(
                            title: Text("Venom",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white)),
                            subtitle: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dapibus aliquet magna, at maximus nunc tempus et. Aliquam condimentum iaculis dolor, vel vulputate purus pharetra at. Curabitur euismod aliquam orci in mattis. Pellentesque ut mollis risus. Vivamus congue sed dolor ut euismod. Vestibulum sit amet turpis eget dolor scelerisque molestie. Aliquam erat volutpat. Aliquam blandit placerat ligula sit amet lobortis. Nullam aliquam metus et vestibulum auctor. Integer ut commodo urna. Donec sodales urna non enim viverra pharetra. Cras vitae vehicula metus. Pellentesque et mollis nulla, et lobortis nulla. Sed semper justo semper justo auctor condimentum. Pellentesque ullamcorper sagittis neque, at vestibulum turpis condimentum ultrices.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.white54)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: Get.height * 0.19,
                      left: Get.width * 0.8,
                      child: FloatingActionButton(
                        backgroundColor: const Color(0xFF272DDA),
                        onPressed: () {},
                        child: Icon(Icons.play_arrow),
                      )),
                  Positioned(
                      top: Get.height * 0.65,
                      right: Get.width * 0.025,
                      left: Get.width * 0.025,
                      child: Container(
                          height: Get.height * 0.25,
                          child: Card(
                              color: Color(0xff1d1c3b),
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(top: Get.height * 0.02),
                                  child: const ListTile(
                                    title: Text("Actors",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white)),
                                  )))))
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

  Widget _buildVideoWidget(VideoResponse data) {
    List<Video> videos = data.videos;
    return FloatingActionButton(
      onPressed: () {
        Get.to(VideoPlayerScreen(
            controller: YoutubePlayerController(
                initialVideoId: videos[0].key,
                flags: const YoutubePlayerFlags(
                  autoPlay: true,
                ))));
      },
      backgroundColor: Colors.blueGrey,
      child: const Icon(Icons.play_arrow),
    );
  }
}
