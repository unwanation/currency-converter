import 'package:currency_converter/model/currency_model.dart';

class ConverterDataModel {
  final double value;
  CurrencyModel currency;
  CurrencyModel requiredCurrency;

  ConverterDataModel(this.value, this.currency, this.requiredCurrency);
}
