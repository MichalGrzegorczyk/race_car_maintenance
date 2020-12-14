import 'package:flutter/material.dart';
import 'details.dart';
import 'dbhelper.dart';
import 'entry.dart';

class carMenuScreen extends StatelessWidget {
  final Entry entry;
  final List<String> menuItems = <String>[
    'Information',
    'Maintenance',
    'Setups',
    'Status',
    'Notifications'
  ];
  final List<int> colorCodes = <int>[600, 500, 400, 300, 200];

  carMenuScreen({this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Car: ${entry.name}',
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings_rounded),
              onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => DetailsScreen(entry: entry))),
              tooltip: "Edit car",
            )
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: menuItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text(' ${menuItems[index]}')),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}
