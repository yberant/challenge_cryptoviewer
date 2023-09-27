//import 'dart:convert';
import 'dart:convert';
import 'dart:io';

import 'package:cryptoviewer/core/util/data_state.dart';
import 'package:cryptoviewer/core/util/enums.dart';
import 'package:cryptoviewer/data/models/coin.dart';
import 'package:cryptoviewer/data/models/coin_history.dart';
import 'package:cryptoviewer/domain/repository_interfaces/coin_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

/*
 Esta implementación del repositorio está hecha solo para trabajar durante la etapa de desarrollo.
 La idea es que en lugar de hacer la request a la API, devuelva los objetos solicitados desde un archivo JSON local. 
 Al usar esta implementación durante el desarrollo.
 NOTA: por temas de simplicidad tampoco se hará uso del servicio coinsApiService. 
 */
class CoinRepositoryOfflineImpl implements CoinRepository {
  //final CoinsApiService _coinsApiService;

  CoinRepositoryOfflineImpl(/*this._coinsApiService*/);

  @override
  Future<DataState<List<CoinModel>>> getAllCoinsData() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      sleep(const Duration(seconds: 2)); //para simular un pequeño delay
      String jsonPath = "lib/core/sample_coins.json";

      List<dynamic> res =
          (json.decode(await rootBundle.loadString(jsonPath)) as List);
      List<CoinModel> coinData = res.map((i) => CoinModel.fromJson(i)).toList();

      //var intValue = Random().nextInt(10);
      //if (intValue <= 2) throw ("errorrrrrr"); //simulacion de error aleatorio
      //print(coinData);
      return DataSuccess(coinData);
    } catch (e) {
      print(e);
      return DataFailed(DioError(
          requestOptions:
              RequestOptions(path: "offline_repository_implementation_error"),
          error: "no se pudieron cargar los datos"));
    }
  }

  @override
  Future<DataState<List<CoinHistoryModel>>> getCoinHistory(
      String assetId, HistoryMode historyMode) async {
    await Future.delayed(Duration(seconds: 2)); //simulacion de delay

    try {
      String jsonPath = "lib/core/sample_history.json";
      List<dynamic> res =
          (json.decode(await rootBundle.loadString(jsonPath)) as List);
      List<CoinHistoryModel> coinHistoryData =
          res.map((i) => CoinHistoryModel.fromJson(i, assetId)).toList();
      print("history data");
      print(coinHistoryData);
      return DataSuccess(coinHistoryData);
    } catch (e) {
      print(e);
      return DataFailed(DioError(
          requestOptions:
              RequestOptions(path: "offline_repository_implementation_error"),
          error: "no se pudieron cargar los datos"));
    }
  }
}
