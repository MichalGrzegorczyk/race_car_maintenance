abstract class DbTable {
  final int id;

  DbTable({this.id});

  Map<String, dynamic> toMap() {
    return {'id': id};
  }

  Map<String, dynamic> toMapWithoutId() {
    return {'id': id};
  }
}
