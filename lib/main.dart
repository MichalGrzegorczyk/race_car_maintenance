import 'package:flutter/material.dart';
import 'dbhelper.dart';
import 'CarMenu.dart';
import 'class/Car.dart';
import 'addCar.dart';

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
  List<Car> cars;
  int numberOfCars = 1;

  @override
  Widget build(BuildContext context) {
    updateList();
    if (numberOfCars > 0)
      return carsListWidget(context);
    else
      return noCarsWidget(context);
  }

  Widget noCarsWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddCarScreen()),
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
          itemCount: numberOfCars,
          itemBuilder: (context, i) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('lib/img/' + cars[i]?.logoName),
                  // backgroundImage: AssetImage('lib/img/bmw.png'),
                ),
                title: Text(cars[i]?.name),
                onTap: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CarMenuScreen(car: cars[i]))),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddCarScreen()),
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
