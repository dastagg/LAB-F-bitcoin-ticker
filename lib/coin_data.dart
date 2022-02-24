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
String cryptoCurrency = 'BTC';
var apiResponse;

class CoinData {
  Future getCoinData({required String fiatCurr}) async {
    String url = '$coinAPIURL/$cryptoCurrency/$fiatCurr?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    print(url);

    if (response.statusCode == 200) {
      apiResponse = jsonDecode(response.body);
      var currentPrice = apiResponse['rate'];
      return currentPrice;
    } else {
      throw (response.statusCode.toString());
    }
  }
}
