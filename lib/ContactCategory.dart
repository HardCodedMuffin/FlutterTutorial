import 'package:flutter/material.dart';

class ContactCategory extends StatelessWidget {
  const ContactCategory({ Key? key, this.icon, this.children }) : super(key: key);

  final IconData? icon;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: themeData.dividerColor))
      ),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.subtitle1!,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                width: 72.0,
                child: Icon(icon, color: themeData.primaryColor),
              ),
              Expanded(child: Column(children: children!)),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({ Key? key, this.icon, required this.lines, this.tooltip, this.onPressed })
      : assert(lines.length > 1),
        super(key: key);

  final IconData? icon;
  final List<String> lines;
  final String? tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...lines.sublist(0, lines.length - 1).map<Widget>((String line) => Text(line)),
                  Text(lines.last, style: themeData.textTheme.caption),
                ],
              ),
            ),
            if (icon != null)
              SizedBox(
                width: 72.0,
                child: IconButton(
                  icon: Icon(icon),
                  color: themeData.primaryColor,
                  onPressed: onPressed,
                ),
              ),
          ],
        ),
      ),
    );
  }
}