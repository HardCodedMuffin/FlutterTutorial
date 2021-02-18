import 'package:flutter/material.dart';
import 'GridListDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid List Demo',
      home: GridListDemo(),
    );
  }
}
