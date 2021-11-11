import 'package:dizi_plat/widgets/bottom_nav_bar.dart';
import 'package:dizi_plat/widgets/homepage_listviews/actors_listview.dart';
import 'package:dizi_plat/widgets/homepage_listviews/male_actors.listview.dart';
import 'package:dizi_plat/widgets/homepage_listviews/moviecardlistivew_widget.dart';
import 'package:dizi_plat/widgets/homepage_listviews/seriescardlistview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFF17162e)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(color: Color(0xFF17162e)),
              child: Column(
                children: [
                  MovieCardListviewWidget(),
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
                  Padding(
                    padding: EdgeInsets.only(
                        left: Get.width * 0.01, right: Get.width * 0.01),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.tealAccent),
                            color: Color(0xff1d1c3b),
                            borderRadius: BorderRadius.circular(16)),
                        height: Get.height * 0.45,
                        child: Column(children: [
                          ActorsList(),
                          MaleActorsList(),

                        ])),
                  ),
                  Container(
                    height: 200,
                  )
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
