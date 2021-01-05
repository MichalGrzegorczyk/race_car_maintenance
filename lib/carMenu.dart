import 'package:flutter/material.dart';
import 'package:race_car_maintenance/carInfo.dart';
import 'details.dart';
import 'class/Car.dart';

class CarMenuScreen extends StatelessWidget {
  final Car car;
  final List<String> menuItems = <String>[
    'Information',
    'Maintenance',
    'Setups',
    'Status',
    'Notifications',
    'Runs'
  ];

  //final List<String>
  final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];

  CarMenuScreen({this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Car: ${car.name}',
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings_rounded),
              onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => DetailsScreen(car: car))),
              tooltip: "Edit car",
            )
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: menuItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Material(
                child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => CarInfoScreen(car: car))),
                    child: Container(
                      height: 50,
                      color: Colors.amber[colorCodes[index]],
                      child: Center(child: Text(' ${menuItems[index]}')),
                    )));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}
