import 'package:dizi_plat/controller/movie_controller.dart';
import 'package:dizi_plat/widgets/homepage_listviews/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieCardListviewWidget extends GetWidget {
  MovieCardListviewWidget({Key? key}) : super(key: key);
  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      decoration: const BoxDecoration(),
      child: Obx(
        () => ListView.builder(
            shrinkWrap: false,
            itemCount: movieController.movies!.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            itemBuilder: (context, index) {
              return CardWidget(
                movie: movieController.movies![index],
              );
            }),
      ),
    );
  }
}
