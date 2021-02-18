import 'package:flutter/material.dart';
import 'package:colors/PaletteTabView.dart';
import 'package:colors/Palette.dart';


class ColorsDemo extends StatelessWidget {
  static const String routeName = '/colors';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Palette.allPalettes.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text('Colors'),
          bottom: TabBar(
            isScrollable: true,
            tabs: Palette.allPalettes.map<Widget>((Palette swatch) => Tab(text: swatch.name)).toList(),
          ),
        ),
        body: TabBarView(
          children: Palette.allPalettes.map<Widget>((Palette colors) {
            return PaletteTabView(colors: colors);
          }).toList(),
        ),
      ),
    );
  }
}