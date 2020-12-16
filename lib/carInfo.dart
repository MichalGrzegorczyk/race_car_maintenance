import 'package:flutter/material.dart';

import 'dbhelper.dart';
import 'class/Car.dart';

class DetailsScreen extends StatelessWidget {
  final Car car;

  DetailsScreen({this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(car.name)),
        body: Column(children: [
          Text(
            car.make,
            textScaleFactor: 2,
          ),
          Text(car.model),
          MaterialButton(
            onPressed: () {
              var helper = DbHelper();
              helper.deleteEntry(car);

              Navigator.pop(context);
            },
            child: Text("Usuń"),
          )
        ]));
  }
}
