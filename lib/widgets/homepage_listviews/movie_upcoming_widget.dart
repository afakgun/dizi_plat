import 'package:dizi_plat/controller/movie_upcoming_controller.dart';
import 'package:dizi_plat/widgets/homepage_listviews/card_upcoming.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieUpCopmingListviewWidget extends GetWidget {
  MovieUpCopmingListviewWidget({Key? key}) : super(key: key);
  MovieUpComingController movieUpComingController =
      Get.put(MovieUpComingController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.35,
      decoration: const BoxDecoration(),
      child: Obx(
        () => ListView.builder(
            shrinkWrap: false,
            itemCount: movieUpComingController.moviescoming!.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            itemBuilder: (context, index) {
              return CardUpComingWidget(
                movieupcoming: movieUpComingController.moviescoming![index],
              );
            }),
      ),
    );
  }
}
