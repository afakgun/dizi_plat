import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dizi_plat/model/tv_model.dart';
import 'package:dizi_plat/model/tvseriestoday_model.dart';
import 'package:dizi_plat/pages/series/seriespage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CardTvTodayWidget extends StatelessWidget {
  CardTvTodayWidget({Key? key, required this.tvseriestoday}) : super(key: key);

  TvSeriesToday tvseriestoday = TvSeriesToday();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          width: Get.width * 0.35,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xff0058CB)),
              color: const Color(0xff1d1c3b),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff0058CB),
                  blurRadius: 5.0,
                  spreadRadius: 0.9,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                ),
              ],
              borderRadius: BorderRadius.circular(24)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              children: [
                tvseriestoday.poster != null ?
                CachedNetworkImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain,
                  imageUrl: "https://image.tmdb.org/t/p/w500/" +
                      tvseriestoday.poster.toString(),
                ) :
                CachedNetworkImage(imageUrl: "https://media.istockphoto.com/vectors/marquee-and-curtain-background-vector-id1208666888?k=20&m=1208666888&s=612x612&w=0&h=w7GeXnFfWA3oCYhy-bXUJJaS0X5Tm68G9wFqEyMYYhs="),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Text(
                      tvseriestoday.title.toString(),
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
      Positioned(
          top: 3,
          right: 12,
          child: Badge(
            borderSide: const BorderSide(color: Color(0xff0058CB), width: 0.5),
            toAnimate: true,
            animationType: BadgeAnimationType.scale,
            animationDuration: const Duration(milliseconds: 700),
            shape: BadgeShape.square,
            badgeColor: const Color(0x5D1D1C3B),
            borderRadius: BorderRadius.circular(16),
            alignment: Alignment.topRight,
            badgeContent: SizedBox(
              height: Get.height * 0.02,
              width: Get.width * 0.055,
              child: Text(
                tvseriestoday.language.toString().toUpperCase(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ))
    ]);
  }
}
