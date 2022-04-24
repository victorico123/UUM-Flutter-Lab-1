import 'dart:convert';

import 'package:crypto/models/coin.dart';
import 'package:http/http.dart' as http;

var currentType = '';

List<Coin> CoinList = [];

void fetchCoin() async {
  CoinList = [];
  final response = await http
      .get(Uri.parse('https://api.coingecko.com/api/v3/exchange_rates'));

  if (response.statusCode == 200) {
    var jsonData = response.body;
    Map<String, dynamic> coinMap = json.decode(jsonData);
    Map<String, dynamic> currencies = coinMap["rates"];
    currencies.forEach((key, value) {
      int i = 0;
      var coinName, coinUnit, coinValue, coinType;
      (value as Map<String, dynamic>).forEach((key2, value2) {
        if (i == 4) {
          i = 0;
        }
        if (i == 0) {
          coinName = value2;
        } else if (i == 1) {
          coinUnit = value2;
        } else if (i == 2) {
          coinValue = value2;
        } else if (i == 3) {
          coinType = value2;
        }
        i++;
      });
      CoinList.add(Coin(coinName, coinUnit, coinType, coinValue));
    });
  } else {
    throw Exception('Failed to load Url');
  }
}
