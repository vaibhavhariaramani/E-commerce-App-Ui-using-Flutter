import 'package:app/models.dart/country.dart';
import 'package:flutter/material.dart';

class Flags extends ChangeNotifier {
  List<Country> _country = [];

  dynamic _countrycode;
  dynamic _flag =
      "https://upload.wikimedia.org/wikipedia/commons/9/9a/Flag_of_Afghanistan.svg";
  dynamic _coun = "Afghanistan";

  void chang(Country item) {
    _country.add(item);
    _countrycode = item.ccode;
    _flag = item.flag;
    _coun = item.name;
    notifyListeners();
  }
}
