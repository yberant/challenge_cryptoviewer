import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:cryptoviewer/core/util/values.dart' as values;
import 'package:cryptoviewer/core/util/date_format.dart' as dateFormat;

import 'dart:developer' as developer;

class CoinsApiService {
  //await dotenv.load(fileName: ".env")

  String? apiKey;
  String? baseURL;
  Dio dio = Dio();
  CoinsApiService() {
    this.baseURL = values.baseURL; //"https://rest.coinapi.io/v1";
  }

  Future<Response> getAllCoins() async {
    if (apiKey == null) {
      await dotenv.load(fileName: ".env");
      apiKey = dotenv.get("X_CoinAPI_key");
    }
    final url = '${values.baseURL}/${values.getCoinsPath}';

    dio.options.headers["X-CoinAPI-Key"] = apiKey;
    dio.options.headers["Content-type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";

    final response = await dio.get(url);
    return response;
  }

  Future<Response> getCoinsHistory(
      String assetId, String periodId, int periodDays) async {
    if (apiKey == null) {
      await dotenv.load(fileName: ".env");
      apiKey = dotenv.get("X_CoinAPI_key");
    }

    final url = '${values.baseURL}/${values.coinHistoryPath(assetId)}';

    dio.options.headers["X-CoinAPI-Key"] = apiKey;
    dio.options.headers["Content-type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";

    DateTime timeEnd = DateTime.now();
    DateTime timeStart = timeEnd.subtract(Duration(days: periodDays));

    //print("url for getCoinsHistory: $url");
    //print("time start: ${dateFormat.dateFormat(timeEnd)}");
    //print("time end: ${dateFormat.dateFormat(timeStart)}");

    final response = await dio.get(url, queryParameters: {
      "period_id": periodId,
      "time_end": dateFormat.dateFormat(timeEnd),
      "time_start": dateFormat.dateFormat(timeStart)
    });
    return response;
  }
}