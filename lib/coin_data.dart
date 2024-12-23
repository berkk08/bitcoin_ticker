
import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

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
const apiKey = '61edb9a9-2622-465f-a5a8-c7378d4b48d4';

//const bitcoinAverageURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker';


class CoinData {

  Future getCoinData(String? selectedCurrency) async{

    Map<String,String> cryptoPrices = {};

    for (String crypto in cryptoList){
      String requestURL = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      //String requestURL = '$bitcoinAverageURL/BTC$selectedCurrency';
      http.Response response = await http.get(Uri.parse(requestURL));

      if(response.statusCode == 200){
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        print('sadasdas');
      }
    }
    return cryptoPrices;
  }

}