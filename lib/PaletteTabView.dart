import 'package:flutter/material.dart';
import 'package:colors/Palette.dart';

class PaletteTabView extends StatelessWidget {
  PaletteTabView({
    Key? key,
    required this.colors,
  })   : assert(colors.isValid),
        super(key: key);

  final Palette colors;

  static const List<int> primaryKeys = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  static const List<int> accentKeys = <int>[100, 200, 400, 700];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle whiteTextStyle = textTheme.bodyText2!.copyWith(color: Colors.white);
    final TextStyle blackTextStyle = textTheme.bodyText2!.copyWith(color: Colors.black);
    return Scrollbar(
      child: ListView(
        itemExtent: kColorItemHeight,
        children: <Widget>[
          ...primaryKeys.map<Widget>((int index) {
            return DefaultTextStyle(
              style: index > colors.threshold ? whiteTextStyle : blackTextStyle,
              child: ColorItem(index: index, color: colors.primary![index]!),
            );
          }),
          if (colors.accent != null)
            ...accentKeys.map<Widget>((int index) {
              return DefaultTextStyle(
                style: index > colors.threshold ? whiteTextStyle : blackTextStyle,
                child: ColorItem(index: index, color: colors.accent![index]!, prefix: 'A'),
              );
            }),
        ],
      ),
    );
  }
}

