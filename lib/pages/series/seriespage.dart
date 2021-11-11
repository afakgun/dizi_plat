import 'package:dizi_plat/model/movie_model.dart';
import 'package:dizi_plat/widgets/homepage_listviews/actors_listview.dart';
import 'package:dizi_plat/widgets/homepage_listviews/male_actors.listview.dart';
import 'package:dizi_plat/widgets/homepage_listviews/seriescardlistview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeriesPage extends GetWidget {
  SeriesPage({Key? key}) : super(key: key);

  Movie poster = Movie();

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
                  SeriesCardListView(),

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
                          color: Colors.tealAccent[700],
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
