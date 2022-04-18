import 'package:dizi_plat/controller/auth_controller.dart';
import 'package:dizi_plat/widgets/homepage_listviews/actors_listview.dart';
import 'package:dizi_plat/widgets/homepage_listviews/male_actors.listview.dart';
import 'package:dizi_plat/widgets/homepage_listviews/moviecardlistivew_widget.dart';
import 'package:dizi_plat/widgets/homepage_listviews/seriescardlistview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget {
  HomePage({Key? key}) : super(key: key);

   

  AuthController authController = Get.put(AuthController());

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
                  ElevatedButton(
                      onPressed: () {
                        print(authController.profilName);
                      },
                      child: Text("asdasda")),
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
                    padding: EdgeInsets.only(left: Get.width * 0.01, right: Get.width * 0.01),
                    child: Container(
                        decoration: BoxDecoration(boxShadow: const [
                          BoxShadow(
                            color: Color(0xffD9EDDF),
                            blurRadius: 5.0,
                            spreadRadius: 0.9,
                            offset: Offset(
                              0.0,
                              0.0,
                            ),
                          )
                        ], border: Border.all(color: const Color(0xffD9EDDF)), color: const Color(0xff1d1c3b), borderRadius: BorderRadius.circular(16)),
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
