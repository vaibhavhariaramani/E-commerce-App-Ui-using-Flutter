class Country {
  final name;
  final flag;
  final ccode;

  Country({this.name, this.flag, this.ccode});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(name: json['name'], flag: json['flag']);
  }
}
