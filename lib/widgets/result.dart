import 'package:flutter/material.dart';
import 'package:currency_converter/model/converter_data_model.dart';
import 'package:currency_converter/utils/convert.dart';
import 'package:currency_converter/widgets/currency_selection.dart';

class Result extends StatefulWidget {
  final ConverterDataModel data;
  const Result({super.key, required this.data});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(18),
          child: CurrencySelection(
            data: widget.data,
          ),
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          '${toPrecision(convert(widget.data.value, widget.data.currency.rate, widget.data.requiredCurrency), 3)}',
          style: const TextStyle(fontSize: 36),
        ),
      ],
    );
  }
}
