import 'package:dizi_plat/model/actor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaleAvatarWidget extends StatelessWidget {
  MaleAvatarWidget({Key? key, required this.man, required this.manName})
      : super(key: key);

  Actor man = Actor();
  Actor manName = Actor();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: Get.width * 0.26,
            height: Get.height * 0.1,
            child: CircleAvatar(
              // backgroundColor: Colors.transparent,
              foregroundImage: NetworkImage(
                "https://image.tmdb.org/t/p/w500/" + man.profilePic.toString(),
                scale: 50,
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            manName.name.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
