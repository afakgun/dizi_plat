import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/model/tv_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTvWidget extends StatelessWidget {
  CardTvWidget({Key? key, required this.tvserieses}) : super(key: key);

  TvSeries tvserieses = TvSeries();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.50,
        height: Get.height * 0.05,
        decoration: BoxDecoration(
            boxShadow: const [], borderRadius: BorderRadius.circular(24)),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          color: Colors.black,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image(
              alignment: Alignment.topCenter,
              fit: BoxFit.contain,
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w500/" + tvserieses.poster.toString(),
              ),
            ),
          ),
        ));
  }
}
