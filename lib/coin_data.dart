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
String fiatCurrency = 'USD';
String cryptoCurrency = 'BTC';
String url = '$coinAPIURL/$cryptoCurrency/$fiatCurrency?apikey=$apiKey';
var apiResponse;

class CoinData {
  Future getCoinData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      apiResponse = jsonDecode(response.body);
      var currentPrice = apiResponse['rate'];
      return currentPrice;
    } else {
      throw (response.statusCode.toString());
    }
  }
}
