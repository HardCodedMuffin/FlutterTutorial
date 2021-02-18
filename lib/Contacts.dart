import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contacts/ContactCategory.dart';

class Contacts extends StatefulWidget {
  static const String routeName = '/contacts';

  @override
  ContactsState createState() => ContactsState();
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class ContactsState extends State<Contacts> {
  final double _appBarHeight = 256.0;

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        platform: Theme.of(context).platform,
      ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: _appBarHeight,
              pinned: _appBarBehavior == AppBarBehavior.pinned,
              floating: _appBarBehavior == AppBarBehavior.floating ||
                  _appBarBehavior == AppBarBehavior.snapping,
              snap: _appBarBehavior == AppBarBehavior.snapping,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.create),
                  tooltip: 'Edit',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Editing isn't supported in this screen."),
                    ));
                  },
                ),
                PopupMenuButton<AppBarBehavior>(
                  onSelected: (AppBarBehavior value) {
                    setState(() {
                      _appBarBehavior = value;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<AppBarBehavior>>[
                    const PopupMenuItem<AppBarBehavior>(
                      value: AppBarBehavior.normal,
                      child: Text('App bar scrolls away'),
                    ),
                    const PopupMenuItem<AppBarBehavior>(
                      value: AppBarBehavior.pinned,
                      child: Text('App bar stays put'),
                    ),
                    const PopupMenuItem<AppBarBehavior>(
                      value: AppBarBehavior.floating,
                      child: Text('App bar floats'),
                    ),
                    const PopupMenuItem<AppBarBehavior>(
                      value: AppBarBehavior.snapping,
                      child: Text('App bar snaps'),
                    ),
                  ],
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Ali Connors'),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      'images/ali_connors.png',
                      fit: BoxFit.cover,
                      height: _appBarHeight,
                    ),
                    // This gradient ensures that the toolbar icons are distinct
                    // against the background image.
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment(0, .35),
                          colors: <Color>[Color(0xC0000000), Color(0x00000000)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.dark,
                  child: ContactCategory(
                    icon: Icons.call,
                    children: <Widget>[
                      ContactItem(
                        icon: Icons.message,
                        tooltip: 'Send message',
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                'Pretend that this opened your SMS application.'),
                          ));
                        },
                        lines: const <String>[
                          '(650) 555-1234',
                          'Mobile',
                        ],
                      ),
                      ContactItem(
                        icon: Icons.message,
                        tooltip: 'Send message',
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('A messaging app appears.'),
                          ));
                        },
                        lines: const <String>[
                          '(323) 555-6789',
                          'Work',
                        ],
                      ),
                      ContactItem(
                        icon: Icons.message,
                        tooltip: 'Send message',
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                'Imagine if you will, a messaging application.'),
                          ));
                        },
                        lines: const <String>[
                          '(650) 555-6789',
                          'Home',
                        ],
                      ),
                    ],
                  ),
                ),
                ContactCategory(
                  icon: Icons.contact_mail,
                  children: <Widget>[
                    ContactItem(
                      icon: Icons.email,
                      tooltip: 'Send personal e-mail',
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text('Here, your e-mail application would open.'),
                        ));
                      },
                      lines: const <String>[
                        'ali_connors@example.com',
                        'Personal',
                      ],
                    ),
                    ContactItem(
                      icon: Icons.email,
                      tooltip: 'Send work e-mail',
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              'Summon your favorite e-mail application here.'),
                        ));
                      },
                      lines: const <String>[
                        'aliconnors@example.com',
                        'Work',
                      ],
                    ),
                  ],
                ),
                ContactCategory(
                  icon: Icons.location_on,
                  children: <Widget>[
                    ContactItem(
                      icon: Icons.map,
                      tooltip: 'Open map',
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text('This would show a map of San Francisco.'),
                        ));
                      },
                      lines: const <String>[
                        '2000 Main Street',
                        'San Francisco, CA',
                        'Home',
                      ],
                    ),
                    ContactItem(
                      icon: Icons.map,
                      tooltip: 'Open map',
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text('This would show a map of Mountain View.'),
                        ));
                      },
                      lines: const <String>[
                        '1600 Amphitheater Parkway',
                        'Mountain View, CA',
                        'Work',
                      ],
                    ),
                    ContactItem(
                      icon: Icons.map,
                      tooltip: 'Open map',
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              'This would also show a map, if this was not a demo.'),
                        ));
                      },
                      lines: const <String>[
                        '126 Severyns Ave',
                        'Mountain View, CA',
                        'Jet Travel',
                      ],
                    ),
                  ],
                ),
                ContactCategory(
                  icon: Icons.today,
                  children: <Widget>[
                    ContactItem(
                      lines: const <String>[
                        'Birthday',
                        'January 9th, 1989',
                      ],
                    ),
                    ContactItem(
                      lines: const <String>[
                        'Wedding anniversary',
                        'June 21st, 2014',
                      ],
                    ),
                    ContactItem(
                      lines: const <String>[
                        'First day in Google office',
                        'January 20th, 2015',
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
