import 'package:dizi_plat/model/actor_model.dart';
import 'package:dizi_plat/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvatarWidget extends StatelessWidget {
  AvatarWidget({Key? key, required this.woman}) : super(key: key);

  Actor woman = Actor();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.26,
        height: Get.height * 0.07,
        child: CircleAvatar(
          // backgroundColor: Colors.transparent,
          foregroundImage: NetworkImage(
            "https://image.tmdb.org/t/p/w500/" + woman.profilePic.toString(),
            scale: 50,
          ),
        ));
  }
}
