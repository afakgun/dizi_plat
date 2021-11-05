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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xF5AD0000)),
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
              Container(
                  height: Get.height * 0.4,
                  child: Column(children: [
                    ActorsList(),
                    MaleActorsList(),
                  ])),
            ],
          ),
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1B1B1B),
        unselectedItemColor: Colors.red,
        selectedItemColor: Colors.black,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Ana Sayfa"),
          const BottomNavigationBarItem(
              icon: InkWell(child: Icon(Icons.movie)), label: "Filmler"),
          const BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Filmler"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Filmler"),
        ],
      ),
    );
  }
}
