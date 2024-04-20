import 'package:flutter/material.dart';
import 'package:currency_converter/main.dart';
import 'package:currency_converter/model/converter_data_model.dart';
import 'package:currency_converter/res/currencies.dart';

class CurrencySelection extends StatefulWidget {
  final ConverterDataModel data;
  const CurrencySelection({super.key, required this.data});

  @override
  State<CurrencySelection> createState() => _CurrencySelectionState();
}

class _CurrencySelectionState extends State<CurrencySelection> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      menuStyle: const MenuStyle(
        visualDensity: VisualDensity.comfortable,
      ),
      leadingIcon: Center(child: Icon(widget.data.requiredCurrency.icon)),
      width: 55,
      trailingIcon: const Center(),
      selectedTrailingIcon: const Center(),
      dropdownMenuEntries: dropdownMenuEntries,
      initialSelection: currencies[0],
      onSelected: (value) {
        controller.add(
          ConverterDataModel(
              widget.data.value.toDouble(), widget.data.currency, value!),
        );
      },
    );
  }
}
