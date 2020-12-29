import 'package:race_car_maintenance/class/DbTable.dart';

class CarInfo implements DbTable {
  final int id;
  final int carId;
  final int engineId;
  final String manufactureDate;
  final String engineCode;

  CarInfo(
      {this.id,
      this.carId,
      this.engineId,
      this.manufactureDate,
      this.engineCode});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'carId': carId,
      'engineId': engineId,
      'manufactureDate': manufactureDate,
      'engineCode': engineCode
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
      'carId': carId,
      'engineId': engineId,
      'manufactureDate': manufactureDate,
      'engineCode': engineCode,
    };
  }

  static CarInfo fromMap(Map<String, dynamic> map) {
    return new CarInfo(
        id: map['id'],
        carId: map['carId'],
        engineId: map['engineId'],
        manufactureDate: map['manufactureDate'],
        engineCode: map['engineCode']);
  }
}
