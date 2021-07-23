import 'package:flutter/material.dart';

import 'app_navigation.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({Key key}) : super(key: key);

  @override
  PeoplePageState createState() => PeoplePageState();
}

class PeoplePageState extends State<PeoplePage> with MainPageStateMixin {
  final List<Color> _colors = [
    Colors.orange,
    Colors.purple,
    Colors.green,
  ];

  int _personCount = 3;

  @override
  void onPageVisible() {
    MainScreen.of(context).params = AppBarParams(
      title: Text('People'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.person_add),
          onPressed: () => setState(() => _personCount++),
        ),
      ],
      backgroundColor: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _personCount,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () => _onTapCard(index),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                    type: MaterialType.circle,
                    color: _colors[index % _colors.length],
                    child: Container(
                      width: 48.0,
                      height: 48.0,
                      alignment: Alignment.center,
                      child:
                          Text('$index', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    'Item #$index',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onTapCard(int index) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Item #$index')));
  }
}
