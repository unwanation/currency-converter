import 'package:flutter/material.dart';
import 'package:currency_converter/main.dart';
import 'package:currency_converter/model/converter_data_model.dart';
import 'package:currency_converter/res/currencies.dart';

class CurrencyDropdown extends StatefulWidget {
  final ConverterDataModel data;
  const CurrencyDropdown({super.key, required this.data});

  @override
  State<CurrencyDropdown> createState() => _CurrencyDropdownState();
}

class _CurrencyDropdownState extends State<CurrencyDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      menuStyle: const MenuStyle(
        visualDensity: VisualDensity.comfortable,
      ),
      leadingIcon: Center(child: Icon(widget.data.currency.icon)),
      width: 55,
      trailingIcon: const Center(),
      selectedTrailingIcon: const Center(),
      dropdownMenuEntries: dropdownMenuEntries,
      initialSelection: currencies[0],
      onSelected: (value) {
        controller.add(
          ConverterDataModel(widget.data.value.toDouble(), value!,
              widget.data.requiredCurrency),
        );
      },
    );
  }
}
