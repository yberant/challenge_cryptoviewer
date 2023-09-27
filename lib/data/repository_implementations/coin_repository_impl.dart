//import 'dart:convert';
import 'dart:io';

import 'package:cryptoviewer/core/util/data_state.dart';
import 'package:cryptoviewer/data/data_sources/remote/coins_api_service.dart';
import 'package:cryptoviewer/data/models/coin.dart';
import 'package:cryptoviewer/data/models/coin_history.dart';
import 'package:cryptoviewer/domain/entities/coin_history.dart';
//import 'package:cryptoviewer/domain/entities/coin.dart';
import 'package:cryptoviewer/domain/repository_interfaces/coin_repository.dart';
import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;

class CoinRepositoryImpl implements CoinRepository {
  final CoinsApiService _coinsApiService;

  CoinRepositoryImpl(this._coinsApiService);

  @override
  Future<DataState<List<CoinModel>>> getAllCoinsData() async {
    Response httpResponse = await _coinsApiService.getAllCoins();

    //TODO: IMPLEMENTAR MANEJO DE ERRORES SI HAY TIEMPO
    if (httpResponse.statusCode == HttpStatus.ok) {
      List<CoinModel> coinData = (httpResponse.data as List)
          .map((cd) => CoinModel.fromJson(cd))
          .toList();
      return DataSuccess(coinData);
    } else {
      return DataFailed(DioError(
          error: httpResponse.statusMessage,
          response: httpResponse,
          type: DioErrorType.response,
          requestOptions: httpResponse.requestOptions));
    }
  }

  @override
  Future<DataState<List<CoinHistoryModel>>> getCoinHistory(
      String assetId, String periodId, int periodDays) async {
    Response httpResponse =
        await _coinsApiService.getCoinsHistory(assetId, periodId, periodDays);
    if (httpResponse.statusCode == HttpStatus.ok) {
      List<CoinHistoryModel> coinHistory = (httpResponse.data as List)
          .map((ch) => CoinHistoryModel.fromJson(ch, assetId))
          .toList();
      return DataSuccess(coinHistory);
    } else {
      return DataFailed(DioError(
          error: httpResponse.statusMessage,
          response: httpResponse,
          type: DioErrorType.response,
          requestOptions: httpResponse.requestOptions));
    }
  }
}
