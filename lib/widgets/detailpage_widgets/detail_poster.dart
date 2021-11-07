import 'package:dizi_plat/model/detail_model.dart';
import 'package:dizi_plat/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class DetailPoster extends GetWidget {
  DetailPoster({
    Key? key, 
  }) : super(key: key);

  Movie poster = Movie();

 

  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: Image(image: NetworkImage("https://image.tmdb.org/t/p/w500/lNyLSOKMMeUPr1RsL4KcRuIXwHt.jpg"),
        ///lNyLSOKMMeUPr1RsL4KcRuIXwHt.jpg
      ),)
    );
  }
}
