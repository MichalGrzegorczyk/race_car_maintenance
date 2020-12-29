import 'package:flutter/material.dart';

import 'dbhelper.dart';
import 'class/Car.dart';

class CarInfoScreen extends StatelessWidget {
  final Car car;

  final String tableName = "carInfo";

  CarInfoScreen({this.car});

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
              helper.deleteEntry(car, tableName);

              Navigator.pop(context);
            },
            child: Text("Usuń"),
          )
        ]));
  }
}
