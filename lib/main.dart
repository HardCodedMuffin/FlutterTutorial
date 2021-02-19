import 'package:flutter/material.dart';
import 'package:buttons/Buttons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ButtonsDemo(),
    );
  }
}
