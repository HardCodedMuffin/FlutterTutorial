import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class ComponentDemoTabData {
  const ComponentDemoTabData({
    this.demoWidget,
    this.exampleCodeTag,
    this.description,
    this.tabName,
    this.documentationUrl,
  });

  final Widget? demoWidget;
  final String? exampleCodeTag;
  final String? description;
  final String? tabName;
  final String? documentationUrl;

  @override
  bool operator==(Object other) {
    if (other.runtimeType != runtimeType)
      return false;
    return other is ComponentDemoTabData
        && other.tabName == tabName
        && other.description == description
        && other.documentationUrl == documentationUrl;
  }

  @override
  int get hashCode => hashValues(tabName, description, documentationUrl);
}

class TabbedComponentDemoScaffold extends StatelessWidget {
  const TabbedComponentDemoScaffold({
    this.title,
    this.demos,
    this.actions,
    this.isScrollable = true,
    this.showExampleCodeAction = true,
  });

  final List<ComponentDemoTabData>? demos;
  final String? title;
  final List<Widget>? actions;
  final bool isScrollable;
  final bool showExampleCodeAction;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: demos!.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title!),
          actions: <Widget>[
            ...?actions,
          ],
          bottom: TabBar(
            isScrollable: isScrollable,
            tabs: demos!.map<Widget>((ComponentDemoTabData data) => Tab(text: data.tabName)).toList(),
          ),
        ),
        body: TabBarView(
          children: demos!.map<Widget>((ComponentDemoTabData demo) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(demo.description!,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Expanded(child: demo.demoWidget!),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
