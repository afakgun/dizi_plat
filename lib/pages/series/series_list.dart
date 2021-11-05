import 'package:flutter/material.dart';

class SeriesList extends StatefulWidget {
  const SeriesList({Key? key}) : super(key: key);

  @override
  _SeriesListState createState() => _SeriesListState();
}

class _SeriesListState extends State<SeriesList> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Film Sayfası"),
    );
  }
}
