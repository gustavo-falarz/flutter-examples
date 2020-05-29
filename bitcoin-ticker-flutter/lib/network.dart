import 'dart:convert';

import 'package:http/http.dart';

class HttpService {
  static String apiKey = 'DA591253-68C3-4F38-BA43-0FC0D867B6C5';
  static String baseUrl = 'https://rest.coinapi.io/v1/exchangerate';

  static Future<String> getRates(String blockChain, String currency) async {
    var url = baseUrl + '/$blockChain/$currency?apikey=$apiKey';
    Response response = await get(url);
    return '$currency ${parseResponse(response)}';
  }

  static String parseResponse(Response response) {
    var json = jsonDecode(response.body);
    double rate = json['rate'];
    return rate.toStringAsFixed(2);
  }

}

