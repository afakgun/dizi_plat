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
        width: Get.width * 0.35,
        decoration: BoxDecoration(
            boxShadow: const [], borderRadius: BorderRadius.circular(24)),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          color: Color(0xff1d1c3b),
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
              )
            ],
          ),
        ));
  }
}
