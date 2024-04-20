import 'package:flutter/material.dart';

class CurrencyModel {
  final String code;
  final String name;
  final IconData icon;
  double rate;

  CurrencyModel(this.code, this.name, this.icon, this.rate);
}
