import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/widgets/moviepage/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardWidget extends StatelessWidget {
  CardWidget({Key? key, required this.movie}) : super(key: key);

  Movie movie = Movie();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.35,
        decoration: BoxDecoration(
            boxShadow: const [], borderRadius: BorderRadius.circular(24)),
        child: GestureDetector(
          onTap: () {
            Get.to(MovieDetail(movie: movie));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            color: Color(0xff1d1c3b),
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
