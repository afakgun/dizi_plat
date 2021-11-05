import 'package:dizi_plat/controller/actor_controller.dart';
import 'package:dizi_plat/widgets/actors_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActorsList extends GetWidget {
  ActorsList({
    Key? key,
  }) : super(key: key);

  ActorController actorController = Get.put(ActorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.3,
      decoration: const BoxDecoration(color: Colors.red),
      child: ListView.builder(
          itemCount: actorController.woman!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return AvatarWidget(
              woman: actorController.woman![index],
            );
          }),
    );
  }
}
