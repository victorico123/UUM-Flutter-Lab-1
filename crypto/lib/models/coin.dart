class Coin {
  String name;
  String unit;
  String type;
  double value;

  Coin(this.name, this.unit, this.type, this.value);

  String get getName {
    return name;
  }

  String get getUnit {
    return unit;
  }

  String get getType {
    return type;
  }

  // double get getValue {
  //   return value;
  // }

  set setName(String name) {
    this.name = name;
  }

  set setUnit(String unit) {
    this.unit = unit;
  }

  set setType(String type) {
    this.type = type;
  }

  set setValue(double value) {
    this.value = value;
  }
}
