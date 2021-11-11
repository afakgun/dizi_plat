import 'package:badges/badges.dart';
import 'package:dizi_plat/controller/movie_controller.dart';
import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/model/movie_upcoming_model.dart';
import 'package:dizi_plat/widgets/moviepage/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CardUpComingWidget extends StatelessWidget {
  CardUpComingWidget({Key? key, required this.movieupcoming}) : super(key: key);

  MovieController actorController = Get.put(MovieController());
  MovieUpComing movieupcoming = MovieUpComing();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          width: Get.width * 0.35,
          decoration: BoxDecoration(
              color: Color(0xff1d1c3b),
              border: Border.all(width: 1, color: Colors.tealAccent),
              boxShadow: const [],
              borderRadius: BorderRadius.circular(24)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              children: [
                Image(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain,
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500/" +
                        movieupcoming.poster.toString(),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: Text(
                        movieupcoming.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: Text(
                        movieupcoming.releaseDate.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      Positioned(
          top: 3,
          right: 12,
          child: Badge(
            borderSide: BorderSide(color: Colors.tealAccent, width: 0.5),
            toAnimate: true,
            animationType: BadgeAnimationType.scale,
            animationDuration: Duration(milliseconds: 700),
            shape: BadgeShape.square,
            badgeColor: Color(0xff1d1c3b),
            borderRadius: BorderRadius.circular(16),
            alignment: Alignment.topRight,
            badgeContent: SizedBox(
              height: Get.height * 0.02,
              width: Get.width * 0.055,
              child: Text(
                movieupcoming.rating.toString(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          )),
      Positioned(
          top: 3,
          child: Badge(
            borderSide: BorderSide(color: Colors.tealAccent, width: 0.5),
            toAnimate: true,
            animationType: BadgeAnimationType.scale,
            animationDuration: Duration(milliseconds: 700),
            shape: BadgeShape.square,
            badgeColor: Color(0xff1d1c3b),
            borderRadius: BorderRadius.circular(16),
            alignment: Alignment.topRight,
            badgeContent: SizedBox(
              height: Get.height * 0.02,
              width: Get.width * 0.18,
              child: Text(
                movieupcoming.releaseDate.toString(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ))
    ]);
  }
}
