import 'package:flutter/material.dart';
import 'package:testenv/people_page.dart';
import 'package:testenv/stats_page.dart';
import 'package:testenv/timeline_page.dart';

class AppBarParams {
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;

  AppBarParams({
    this.title,
    this.actions,
    this.backgroundColor,
  });
}

class MainScreen extends StatefulWidget {
  final int initialPage;

  const MainScreen({
    Key? key,
    this.initialPage = 0,
  }) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();

  static MainScreenState? of(BuildContext context) {
    return context.findAncestorStateOfType<MainScreenState>();
  }
}

class MainScreenState extends State<MainScreen> {
  final List<GlobalKey<MainPageStateMixin>> _pageKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  PageController? _pageController;
  AppBarParams? _params;
  int? _page;

  set params(AppBarParams value) {
    setState(() => _params = value);
  }

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
    _pageController = PageController(initialPage: _page!);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _pageKeys[0].currentState!.onPageVisible();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _params?.title,
        actions: _params?.actions,
        backgroundColor: _params?.backgroundColor,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          PeoplePage(key: _pageKeys[0]),
          TimelinePage(key: _pageKeys[1]),
          StatsPage(key: _pageKeys[2]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page!,
        onTap: _onBottomNavItemPressed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: ('people'),
            icon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            label: ('timeline'),
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            label: ('stats'),
            icon: Icon(Icons.pie_chart),
          ),
        ],
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    _onPageChanged(_page);
  }

  void _onPageChanged(int? page) {
    setState(() => _page = page);
    _pageKeys[_page!].currentState!.onPageVisible();
  }

  void _onBottomNavItemPressed(int index) {
    setState(() => _page = index);
    _pageController!.animateToPage(
      index,
      duration: Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
  }
}

mixin MainPageStateMixin<T extends StatefulWidget> on State<T> {
  void onPageVisible();
}
