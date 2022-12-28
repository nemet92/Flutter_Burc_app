import 'package:flutter/material.dart';
import 'package:flutter_burc_app/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({super.key, required this.secilenBurc});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.transparent;
  late PaletteGenerator _generator;
  @override
  void initState() {
    appBarRengiBul();
    WidgetsBinding.instance.addPostFrameCallback((_) => appBarRengiBul());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özelikleri"),
              background: Image.asset(
                // ignore: prefer_interpolation_to_compose_strings
                'images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appBarRengiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
    appBarRengi = _generator.vibrantColor!.color;
    setState(() {});
  }
}
