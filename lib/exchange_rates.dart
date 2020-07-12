import 'dart:convert';
import 'package:http/http.dart' as http;

class CoinData {
  Future<dynamic> getExchangeRate(String cash) async {
    Map<String, String> exchangeRates = {};
    for (String crypto in cryptoList) {
      var url =
          'https://api.coingecko.com/api/v3/simple/price?ids=$crypto&vs_currencies=$cash';
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var exchangeRate = await jsonDecode(response.body);
        dynamic rate = exchangeRate['$crypto']['$cash'];
        exchangeRates[crypto] = rate.toStringAsFixed(2);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return exchangeRates;
  }
}

const List<String> currenciesList = [
  'aud',
  'brl',
  'cad',
  'cny',
  'eur',
  'hkd',
  'inr',
  'jpy',
  'nzd',
  'rub',
  'sgd',
  'usd',
];

const List<String> cryptoList = [
  'bitcoin',
  'ethereum',
  'monero',
  'zcash',
  'litecoin',
  'eos',
  'tether',
  'ripple',
  'stellar',
];
