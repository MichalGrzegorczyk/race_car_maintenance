import 'package:flutter/material.dart';
import 'dbhelper.dart';
import 'entry.dart';
import 'carMenu.dart';
import 'details.dart';
import 'class/Car.dart';
import 'add.dart';
import 'package:sqflite/sqflite.dart';

var carList = [Car(id: "1", name: "kompot", make: "BMW", model: "E36 Compact")];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Race Car Maintenance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Choose car'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DbHelper dbHelper = DbHelper();
  List<Entry> cars;
  int numberOfCars = 0;

  @override
  Widget build(BuildContext context) {
    updateList();
    if (cars.length == 0)
      return noCarsWidget(context);
    else
      return carsListWidget(context);
  }

  Widget noCarsWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddScreen()),
        ),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget carsListWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, i) => ListTile(
                title: Text(cars[i]?.name),
                onTap: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => carMenuScreen(entry: cars[i]))),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddScreen()),
        ),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void updateList() {
    dbHelper.open().then((_) => dbHelper.getEntries().then((value) => {
          setState(() {
            cars = value;
            numberOfCars = cars.length;
          })
        }));
  }
}
