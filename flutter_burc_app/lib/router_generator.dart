import 'package:flutter/material.dart';
import 'package:flutter_burc_app/model/burc.dart';
import 'package:flutter_burc_app/screens/burc_detay.dart';
import 'package:flutter_burc_app/screens/burc_listesi.dart';

class RouterGenerator {
  static Route<dynamic>? routeGenrator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => BurcListesi());
      case '/burcDetay':
        final secilen = settings.arguments as Burc;
        return MaterialPageRoute(
            builder: (context) => BurcDetay(secilenBurc: secilen));
    }
    return null;
  }
}
