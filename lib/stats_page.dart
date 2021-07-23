import 'package:flutter/material.dart';

import 'app_navigation.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key key}) : super(key: key);

  @override
  StatsPageState createState() => StatsPageState();
}

class StatsPageState extends State<StatsPage> with MainPageStateMixin {
  @override
  void onPageVisible() {
    MainScreen.of(context).params = AppBarParams(
      title: Text('Stats'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add_box),
          onPressed: () {},
        ),
      ],
      backgroundColor: Colors.orange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Coming soon'),
    );
  }
}
