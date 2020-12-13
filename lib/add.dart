import 'dbhelper.dart';
import 'entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController makeController = new TextEditingController();
  TextEditingController modelController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dodaj nowe auto"),
        ),
        body: Column(
          children: [
            TextField(controller: nameController),
            TextField(controller: makeController),
            TextField(controller: modelController),
            MaterialButton(
              onPressed: () {
                var helper = DbHelper();
                //helper.open();
                helper.insertEntry(new Entry(
                    id: 0,
                    name: nameController.text,
                    make: makeController.text,
                    model: modelController.text));
                Navigator.pop(context);
              },
              child: Text("Dodaj"),
            )
          ],
        ));
  }
}