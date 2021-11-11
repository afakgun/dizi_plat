import 'package:badges/badges.dart';
import 'package:dizi_plat/controller/movie_controller.dart';
import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/widgets/moviepage/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CardWidget extends StatelessWidget {
  CardWidget({Key? key, required this.movie}) : super(key: key);

  MovieController actorController = Get.put(MovieController());
  Movie movie = Movie();

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
          child: GestureDetector(
            onTap: () {
              Get.to(MovieDetail(movie: movie));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Column(
                children: [
                  Image(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/" +
                          movie.poster.toString(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: Text(
                        movie.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
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
                movie.rating.toString(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ))
    ]);
  }
}
