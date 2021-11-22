import 'package:dizi_plat/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailOverview extends StatelessWidget {
  DetailOverview({
    Key? key,
  }) : super(key: key);

  Movie movie = Movie();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height * 0.22,
      right: Get.width * 0.025,
      left: Get.width * 0.025,
      child: Container(
        height: Get.height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xff1d1c3b),
          border: Border.all(width: 1, color: Colors.tealAccent),
          boxShadow: [
            BoxShadow(
              color: Colors.tealAccent.withAlpha(100),
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
                title: Text(movie.title.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white)),
                subtitle: Text(movie.overview.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white54)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
