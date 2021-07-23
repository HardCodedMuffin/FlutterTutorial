import 'package:flutter/material.dart';

import 'app_navigation.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: MainScreen(),
    );
  }
}
