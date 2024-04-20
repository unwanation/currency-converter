import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> fetchRates() async {
  var response =
      await http.get(Uri.parse('https://open.er-api.com/v6/latest/USD'));
  final rates = json.decode(response.body)['rates'];
  return rates;
}
