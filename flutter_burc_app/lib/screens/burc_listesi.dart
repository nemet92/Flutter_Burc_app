import 'package:flutter/material.dart';
import 'package:flutter_burc_app/screens/burc_item.dart';
import 'package:flutter_burc_app/data/strings.dart';
import 'package:flutter_burc_app/model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Burclar Listesi"),
        ),
        body: ListView.builder(
            itemCount: tumBurclar.length,
            itemBuilder: (context, index) {
              return BurcItem(listelenenBurc: tumBurclar[index]);
            }));
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetayi = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim =
          "${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png";
      var burcBuyukResim =
          "${Strings.BURC_ADLARI[i].toLowerCase()}${"_buyuk"}${i + 1}.png";

      Burc eklenecekBurc =
          Burc(burcAdi, burcTarihi, burcDetayi, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
