import 'package:currency_converter/main.dart';
import 'package:currency_converter/model/converter_data_model.dart';
import 'package:currency_converter/widgets/currency_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatefulWidget {
  final ConverterDataModel data;
  const Input({super.key, required this.data});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: CurrencyDropdown(
            data: widget.data,
          ),
        ),
        SizedBox(
          width: 200,
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: widget.data.currency.name.replaceFirst(
                  widget.data.currency.name[0],
                  widget.data.currency.name[0].toUpperCase()),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {
              controller.add(ConverterDataModel(
                int.parse('0$value').toDouble(),
                widget.data.currency,
                widget.data.requiredCurrency,
              ));
            },
          ),
        )
      ],
    );
  }
}
