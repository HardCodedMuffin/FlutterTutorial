import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/second': (context) => SecondScreen(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(
         'First Route'
       ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Launch Screen'
          ),
          onPressed: () {
            // Navigate to the second screen when tapped.
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Route'
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Go Back!'
          ),
          onPressed: () {
            // Navigate back to first screen when tapped.
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

