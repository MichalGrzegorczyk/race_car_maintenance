import 'package:flutter/material.dart';

import 'dbhelper.dart';
import 'class/Car.dart';

class CustomTextStyle {
  static TextStyle rowLeft(BuildContext context) {
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontFamily: 'Calibri',
        fontSize: 40);
  }

  static TextStyle rowRight(BuildContext context) {
    return TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
        fontFamily: 'Open Sans',
        fontSize: 40);
  }

  static TextStyle deleteButton(BuildContext context) {
    return TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
        fontFamily: 'Open Sans',
        fontSize: 40);
  }
}

class DetailsScreen extends StatelessWidget {
  final Car car;

  DetailsScreen({this.car});

  String tableName = "cars";

  @override
  Widget build(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      textColor: Colors.white,
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      textColor: Colors.black,
      child: Text("Yes"),
      onPressed: () {
        var helper = DbHelper();
        helper.deleteEntry(car, tableName);

        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Warning!"),
      elevation: 24.0,
      content: Text(
          "This car will be deleted permamently and all it's data will be lost! Do you still want to proceed?"),
      actions: [
        cancelButton,
        continueButton,
      ],
      backgroundColor: Colors.red,
    );
    return Scaffold(
        appBar: AppBar(title: Text(car.getName)),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              height: 50,
              color: Colors.amber[600],
              child: Center(
                  child: Row(children: <Widget>[
                Text("Make: ",
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.rowLeft(context)),
                Text(
                  car.getMake,
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.rowRight(context),
                )
              ])),
            ),
            Container(
              height: 50,
              color: Colors.amber[600],
              child: Center(
                  child: Row(children: <Widget>[
                Text("Model: ",
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.rowLeft(context)),
                Expanded(
                    child: Text(
                  car.getModel,
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.rowRight(context),
                ))
              ])),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                child: Text(
                  "Delete",
                  style: CustomTextStyle.deleteButton(context),
                ),
              ),
            ),
          ],
        ));
  }
}
