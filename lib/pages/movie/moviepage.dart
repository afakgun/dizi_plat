import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/model/movie_upcoming_model.dart';
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
      backgroundColor: const Color(0xFF17162e),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF17162e)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFF17162e)),
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.4,
                    decoration: BoxDecoration(
                        color: Color(0xff1d1c3b),
                        border: Border.all(width: 1, color: Colors.tealAccent),
                        boxShadow: const [],
                        borderRadius: BorderRadius.circular(24)),
                    child: const Center(
                      child: Text(
                        "Popüler Filmler",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  MovieCardListviewWidget(),
                  Container(
                    height: Get.height * 0.05,
                    width: Get.width * 0.4,
                    decoration: BoxDecoration(
                        color: Color(0xff1d1c3b),
                        border: Border.all(width: 1, color: Colors.tealAccent),
                        boxShadow: const [],
                        borderRadius: BorderRadius.circular(24)),
                    child: const Center(
                      child: Text(
                        "Vizyondakiler",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
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
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.01, right: Get.width * 0.01),
                    child: Container(
                        decoration: BoxDecoration(
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
                            border:
                                Border.all(color: Colors.tealAccent, width: 1),
                            color: const Color(0xff1d1c3b),
                            borderRadius: BorderRadius.circular(16)),
                        height: Get.height * 0.45,
                        child: Column(children: [
                          ActorsList(),
                          MaleActorsList(),
                        ])),
                  ),
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
