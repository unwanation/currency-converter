import 'package:currency_converter/model/currency_model.dart';

double convert(double value, double rate, CurrencyModel requiredCurrency) {
  return (value / rate * requiredCurrency.rate);
}

double toPrecision(double value, int precision) =>
    double.parse(value.toStringAsFixed(precision));
