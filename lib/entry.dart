class Entry {
  final int id;
  final String name;
  final String make;
  final String model;
  Entry({this.id, this.name, this.make, this.model});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'make': make,
      'model': model,
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
      'name': name,
      'make': make,
      'model': model,
    };
  }

  static Entry fromMap(Map<String, dynamic> map) {
    return new Entry(
        id: map['id'],
        name: map['name'],
        make: map['make'],
        model: map['model']);
  }
}
