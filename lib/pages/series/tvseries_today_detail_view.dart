import 'package:dizi_plat/controller/actor_controller.dart';
import 'package:dizi_plat/controller/castlist_controller.dart';
import 'package:dizi_plat/controller/movie_detail_controller.dart';
import 'package:dizi_plat/model/castlist_model.dart';
import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/model/trailer.dart';
import 'package:dizi_plat/model/tv_model.dart';
import 'package:dizi_plat/model/video.dart';

import 'package:dizi_plat/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widgets/homepage_listviews/actors_avatar.dart';

class TvSeriesTodayDetail extends StatelessWidget {
  TvSeriesTodayDetail({
    Key? key,
    required this.overview,
    required this.backPoster,
    this.title,
  }) : super(key: key);

  late YoutubePlayerController _controller;

  TvSeries tvSeries = TvSeries();
  ActorController actorController = Get.put(ActorController());
  // CastListController castListController = Get.put(CastListController());

  String overview;
  int? id;
  dynamic popularity;
  String? title;
  String? backPoster;
  String? castName;

  dynamic rating;

  // @override
  // void initState() {
  //   _controller = YoutubePlayerController(
  //     initialVideoId: 'gU4vcJIbeOU',
  //     flags: const YoutubePlayerFlags(
  //       mute: false,
  //       autoPlay: false,
  //     ),
  //   );
  //   super.initState();
  // }

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
                      child: Image(
                        image: backPoster == "null"
                            ? NetworkImage(
                                "https://media.istockphoto.com/vectors/marquee-and-curtain-background-vector-id1208666888?k=20&m=1208666888&s=612x612&w=0&h=w7GeXnFfWA3oCYhy-bXUJJaS0X5Tm68G9wFqEyMYYhs=")
                            : NetworkImage(
                                "https://image.tmdb.org/t/p/w500/$backPoster"),

                        ///lNyLSOKMMeUPr1RsL4KcRuIXwHt.jpg
                      )),
                  Positioned(
                    top: Get.height * 0.22,
                    right: Get.width * 0.025,
                    left: Get.width * 0.025,
                    child: Container(
                      height: Get.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff1d1c3b),
                        border: Border.all(width: 1, color: Color(0xff0058CB)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff0058CB),
                            blurRadius: 5.0,
                            spreadRadius: 0.9,
                            offset: const Offset(
                              0.0,
                              0.0,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.02),
                            child: ListTile(
                              title: Text(title.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.white)),
                              subtitle: Text(overview,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Colors.white54)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // playTrailer(),
                  Positioned(
                      top: Get.height * 0.65,
                      right: Get.width * 0.025,
                      left: Get.width * 0.025,
                      child: SizedBox(
                          height: Get.height * 0.25,
                          child: Container(
                            height: Get.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xff1d1c3b),
                              border: Border.all(
                                  width: 1, color: Color(0xff0058CB)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff0058CB),
                                  blurRadius: 5.0,
                                  spreadRadius: 0.9,
                                  offset: const Offset(
                                    0.0,
                                    0.0,
                                  ),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: Get.height * 0.01),
                                    child: const ListTile(
                                      title: Center(
                                        child: Text("Actors",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color: Colors.white)),
                                      ),
                                    )),
                                SizedBox(
                                  height: Get.height * 0.16,
                                  child: Obx(
                                    () => ListView.builder(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        itemCount:
                                            actorController.woman!.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return AvatarWidget(
                                            // castName: castListController.cast![index],
                                            woman:
                                                actorController.woman![index],
                                            nameWoman: actorController
                                                .womanName![index],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          )))
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
          backgroundColor: Colors.tealAccent.withAlpha(250),
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
