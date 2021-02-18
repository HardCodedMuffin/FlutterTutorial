import 'package:flutter/material.dart';

const double kColorItemHeight = 48.0;

class Palette {
 Palette({this.name, this.primary, this.accent, this.threshold = 900});

 final String? name;
 final MaterialColor? primary;
 final MaterialAccentColor? accent;
 final int threshold;

 bool get isValid => name != null && primary != null;

 static final List<Palette> allPalettes = <Palette>[
  Palette(name: 'RED', primary: Colors.red, accent: Colors.redAccent, threshold: 300),
  Palette(name: 'PINK', primary: Colors.pink, accent: Colors.pinkAccent, threshold: 200),
  Palette(name: 'PURPLE', primary: Colors.purple, accent: Colors.purpleAccent, threshold: 200),
  Palette(name: 'DEEP PURPLE', primary: Colors.deepPurple, accent: Colors.deepPurpleAccent, threshold: 200),
  Palette(name: 'INDIGO', primary: Colors.indigo, accent: Colors.indigoAccent, threshold: 200),
  Palette(name: 'BLUE', primary: Colors.blue, accent: Colors.blueAccent, threshold: 400),
  Palette(name: 'LIGHT BLUE', primary: Colors.lightBlue, accent: Colors.lightBlueAccent, threshold: 500),
  Palette(name: 'CYAN', primary: Colors.cyan, accent: Colors.cyanAccent, threshold: 600),
  Palette(name: 'TEAL', primary: Colors.teal, accent: Colors.tealAccent, threshold: 400),
  Palette(name: 'GREEN', primary: Colors.green, accent: Colors.greenAccent, threshold: 500),
  Palette(name: 'LIGHT GREEN', primary: Colors.lightGreen, accent: Colors.lightGreenAccent, threshold: 600),
  Palette(name: 'LIME', primary: Colors.lime, accent: Colors.limeAccent, threshold: 800),
  Palette(name: 'YELLOW', primary: Colors.yellow, accent: Colors.yellowAccent),
  Palette(name: 'AMBER', primary: Colors.amber, accent: Colors.amberAccent),
  Palette(name: 'ORANGE', primary: Colors.orange, accent: Colors.orangeAccent, threshold: 700),
  Palette(name: 'DEEP ORANGE', primary: Colors.deepOrange, accent: Colors.deepOrangeAccent, threshold: 400),
  Palette(name: 'BROWN', primary: Colors.brown, threshold: 200),
  Palette(name: 'GREY', primary: Colors.grey, threshold: 500),
  Palette(name: 'BLUE GREY', primary: Colors.blueGrey, threshold: 500),
 ];
 
}

class ColorItem extends StatelessWidget {
 const ColorItem({
  Key? key,
  required this.index,
  required this.color,
  this.prefix = '',
}) : super (key: key);

 final int index;
 final Color color;
 final String prefix;

 String colorString() => "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  @override
  Widget build(BuildContext context) {
    return Semantics(
     container: true,
     child: Container(
      height: kColorItemHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      color: color,
      child: SafeArea(
       top: false,
       bottom: false,
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         Text('$prefix$index'),
         Text(colorString()),
        ],
       ),
      ),
     ),
    );
  }
}
