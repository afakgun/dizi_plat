import 'package:dizi_plat/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends StatelessWidget {

  
  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(color: Color(0xFF17162e)),
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Container(
                        decoration:
                            const BoxDecoration(color: Color(0xFF17162e)),
                        height: Get.height * 1.5,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: Get.height * 0.35,
                              child: Image(
                                image: NetworkImage(movie.poster.toString()),
                              ),
                            )
                          ],
                        ))))));
  }
}
