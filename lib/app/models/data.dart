class Data {
  late final double height;
  late final double weight;

  Data(this.height, this.weight);

  Data.fromMap(Map<String, dynamic> map) {
    height = double.parse(map['height']);
    weight = double.parse(map['weight']);
  }
}
