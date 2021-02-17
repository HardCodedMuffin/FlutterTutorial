import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; //show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        body: Center(child: _buildImageColumn()),
      ),
    );
  }

  Widget _buildImageColumn() => Container(
        decoration: BoxDecoration(
          color: Colors.black38,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildImageRow(18),
            _buildImageRow(20),
          ],
        ),
      );

  Widget _buildDecoratedImage(int imageIndex) => Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 20, color: Colors.black38),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Image.asset('images/pic$imageIndex.jpg'),
        ),
      );

  Widget _buildImageRow(int imageIndex) => Row(
        children: [
          _buildDecoratedImage(imageIndex),
          _buildDecoratedImage(imageIndex + 1),
        ],
      );
}
