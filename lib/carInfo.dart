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
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text("")),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text("")),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: MaterialButton(
                onPressed: () {
                  var helper = DbHelper();
                  helper.deleteEntry(car, tableName);

                  Navigator.pop(context);
                },
                child: Text("Usuń"),
              ),
            ),
          ],
        ));
  }
}
