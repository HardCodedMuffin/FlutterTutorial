import 'package:flutter/material.dart';
import 'package:cards_advanced/TravelDestination.dart';

class Cards extends StatefulWidget {
  static const String routeName = '/material/cards';

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  ShapeBorder? _shape;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.sentiment_very_satisfied,
              semanticLabel: 'update shape',
            ),
            onPressed: () {
              setState(() {
                _shape = _shape != null
                    ? null
                    : const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                          bottomLeft: Radius.circular(2.0),
                          bottomRight: Radius.circular(2.0),
                        ),
                      );
              });
            },
          ),
        ],
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          children: destinations.map<Widget>((TravelDestination destination) {
            Widget? child;
            switch (destination.type) {
              case CardType.standard:
                child = TravelDestinationItem(
                    destination: destination, shape: _shape);
                break;
              case CardType.tappable:
                child = TappableTravelDestinationItem(
                    destination: destination, shape: _shape);
                break;
              case CardType.selectable:
                child = SelectableTravelDestinationItem(
                    destination: destination, shape: _shape);
                break;
            }

            return Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: child,
            );
          }).toList(),
        ),
      ),
    );
  }
}
