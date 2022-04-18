import 'package:dizi_plat/controller/actor_controller.dart';
import 'package:dizi_plat/controller/castlist_controller.dart';
import 'package:dizi_plat/model/actor_model.dart';
import 'package:dizi_plat/model/castlist_model.dart';
import 'package:dizi_plat/widgets/homepage_listviews/actors_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailActors extends GetWidget {
  DetailActors({
    Key? key,
  }) : super(key: key);

  Actor man = Actor();
  ActorController actorController = Get.put(ActorController());
  // CastListController castListController = Get.put(CastListController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: Get.height * 0.65,
        right: Get.width * 0.025,
        left: Get.width * 0.025,
        child: SizedBox(
            height: Get.height * 0.25,
            child: Container(
              height: Get.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xff1d1c3b),
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
                      padding: EdgeInsets.only(top: Get.height * 0.01),
                      child: const ListTile(
                        title: Center(
                          child: Text("Actors",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                      )),
                  SizedBox(
                    height: Get.height * 0.16,
                    child: Obx(
                      () => ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          itemCount: actorController.woman!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return AvatarWidget(
                              // castName: castListController.cast![index],
                              woman: actorController.woman![index],
                              nameWoman: actorController.womanName![index],
                            );
                          }),
                    ),
                  ),
                ],
              ),
            )));
  }
}
