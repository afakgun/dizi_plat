import 'package:badges/badges.dart';
import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/model/tv_model.dart';
import 'package:dizi_plat/pages/series/seriespage.dart';
import 'package:dizi_plat/widgets/detailpage_widgets/detail_poster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CardTvWidget extends StatelessWidget {
  CardTvWidget({Key? key, required this.tvserieses}) : super(key: key);

  TvSeries tvserieses = TvSeries();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          width: Get.width * 0.35,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.tealAccent),
              color: Color(0xff1d1c3b),
              boxShadow: const [],
              borderRadius: BorderRadius.circular(24)),
          child: GestureDetector(
            onTap: () {
              Get.to(SeriesPage());
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
                          tvserieses.poster.toString(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: Text(
                        tvserieses.title.toString(),
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
                tvserieses.rating.toString(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ))
    ]);
  }
}
