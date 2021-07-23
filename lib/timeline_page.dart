import 'package:flutter/material.dart';

import 'app_navigation.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key key}) : super(key: key);

  @override
  TimelinePageState createState() => TimelinePageState();
}

class TimelinePageState extends State<TimelinePage> with MainPageStateMixin {
  @override
  void onPageVisible() {
    MainScreen.of(context).params = AppBarParams(
      title: Text('Timeline'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.alarm_add),
          onPressed: () {},
        ),
      ],
      backgroundColor: Colors.purple,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Coming soon'),
    );
  }
}
