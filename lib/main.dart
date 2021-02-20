import 'package:flutter/material.dart';
import 'package:gesture_detector/TapBoxA.dart';
import 'package:gesture_detector/TapBoxB.dart';
import 'package:gesture_detector/TapBoxC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TapBoxA(),
                ParentWidgetB(), // Handles TapBox B
                ParentWidgetC(), // Handles TapBox C
              ],
            ),
        ),
      ),
    );
  }
}
