import 'package:carousel_slider/carousel_slider.dart';
import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/model/movie_upcoming_model.dart';
import 'package:dizi_plat/widgets/bottom_nav_bar.dart';
import 'package:dizi_plat/widgets/homepage_listviews/actors_listview.dart';
import 'package:dizi_plat/widgets/homepage_listviews/male_actors.listview.dart';
import 'package:dizi_plat/widgets/homepage_listviews/movie_upcoming_widget.dart';
import 'package:dizi_plat/widgets/homepage_listviews/moviecardlistivew_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviePage extends GetWidget {
  MoviePage({Key? key}) : super(key: key);

  Movie poster = Movie();
  MovieUpComing movieupcoming = MovieUpComing();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17162e),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF17162e)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFF17162e)),
              child: Column(
                children: [
                  MovieCardListviewWidget(),

                  MovieUpCopmingListviewWidget(),

                  // Container(
                  //   height: Get.height * 0.30,
                  //   width: Get.width,!
                  //   decoration: const BoxDecoration(color: Colors.amber),
                  //   child: ListView.builder(
                  //       itemCount: 10,
                  //       scrollDirection: Axis.horizontal,
                  //       padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  //       itemBuilder: (context, index) {
                  //         return CardWidget();
                  //       }),
                  // ),
                  Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.tealAccent, width: 1),
                          color: Color(0xff1d1c3b),
                          borderRadius: BorderRadius.circular(16)),
                      height: Get.height * 0.45,
                      child: Column(children: [
                        ActorsList(),
                        MaleActorsList(),
                      ])),
                ],
              ),
            ),
          ),
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
    );
  }
}
