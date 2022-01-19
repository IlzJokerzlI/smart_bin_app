class Data {
  static const maxHeight = 300;
  static const maxWeight = 5000;

  late final double height;
  late final double weight;

  int get heightPercentage =>
      (height > maxHeight) ? 100 : (height * 100) ~/ maxHeight;
  int get weightPercentage =>
      (weight > maxWeight) ? 100 : (weight * 100) ~/ maxWeight;

  Data(this.height, this.weight);

  Data.fromMap(Map<String, dynamic> map) {
    height = double.parse(map['height']);
    weight = double.parse(map['weight']);
  }
}
