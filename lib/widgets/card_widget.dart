import 'package:dizi_plat/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardWidget extends StatelessWidget {
  CardWidget({Key? key, required this.movie}) : super(key: key);

  Movie movie = Movie();

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
                "https://image.tmdb.org/t/p/w500/" + movie.poster.toString(),
              ),
            ),
          ),
        ));
  }
}
