import 'package:dizi_plat/model/dark_theme_model.dart';
import 'package:flutter/material.dart';

class KaranlikTemaProvider with ChangeNotifier {
  KaranlikModAyarlari karanlikModAyarlari = KaranlikModAyarlari();

  bool _karanlikMod = false;
  bool get karanlikMod => _karanlikMod;

  set karanlikMod(bool value) {
    _karanlikMod = value;
    karanlikModAyarlari.setDarkTheme(value);
    notifyListeners();
  }
}