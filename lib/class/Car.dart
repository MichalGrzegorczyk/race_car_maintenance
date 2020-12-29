import 'package:race_car_maintenance/class/DbTable.dart';

class Car implements DbTable {
  final int id;
  final String name;
  final String make;
  final String model;
  final String logoName;

  Car({this.id, this.name, this.make, this.model, this.logoName});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'make': make,
      'model': model,
      'logoName': logoName
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
      'name': name,
      'make': make,
      'model': model,
      'logoName': logoName,
    };
  }

  static Car fromMap(Map<String, dynamic> map) {
    return new Car(
        id: map['id'],
        name: map['name'],
        make: map['make'],
        model: map['model'],
        logoName: map['logoName']);
  }
}
