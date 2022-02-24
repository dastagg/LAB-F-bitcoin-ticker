import 'package:http/http.dart' as http;
import 'dart:convert';
import 'auth/secrets.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = coinAPIKey;

class CoinData {
  Future getCoinData({required String fiatCurr}) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String url = '$coinAPIURL/$crypto/$fiatCurr?apikey=$apiKey';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var apiResponse = jsonDecode(response.body);
        double price = apiResponse['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(4);
      } else {
        String stCode = response.statusCode.toString();
        throw ('Problem with the get request - statusCode = $stCode');
      }
    }
    return cryptoPrices;
  }
}
