import 'dbhelper.dart';
import 'class/Car.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCarScreen extends StatefulWidget {
  @override
  _AddCarScreenState createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController makeController = new TextEditingController();
  TextEditingController modelController = new TextEditingController();
  String tableName = "cars";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New car"),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                )),
            SizedBox(height: 10),
            TextField(
                controller: makeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Make',
                )),
            SizedBox(height: 10),
            TextField(
                controller: modelController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Model',
                )),
            MaterialButton(
              onPressed: () {
                var helper = DbHelper();

                //helper.open();
                helper.insertEntry(
                    new Car(
                        id: 0,
                        name: nameController.text,
                        make: makeController.text,
                        model: modelController.text,
                        logoName: "bmw.png"),
                    tableName);
                Navigator.pop(context);
              },
              child: Text("Add"),
            )
          ],
        ));
  }
}
