import 'package:flutter/material.dart';
import 'package:currency_converter/model/currency_model.dart';

final List<CurrencyModel> currencies = [
  CurrencyModel('USD', 'dollar', Icons.attach_money, 1),
  CurrencyModel('RUB', 'ruble', Icons.currency_ruble, 92.59),
  CurrencyModel('TRY', 'lira', Icons.currency_lira, 23),
  CurrencyModel('EUR', 'euro', Icons.euro, 0.7),
  CurrencyModel('BYN', 'belruble', Icons.currency_bitcoin, 2),
];

final List<DropdownMenuEntry<CurrencyModel>> dropdownMenuEntries = currencies
    .map((element) => (DropdownMenuEntry(
        label: '', leadingIcon: Icon(element.icon), value: element)))
    .toList();

void updateRates(Map rates) {
  for (final currency in currencies) {
    currency.rate = rates[currency.code];
  }
}
