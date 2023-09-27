import 'package:cryptoviewer/core/util/data_state.dart';
//import 'package:cryptoviewer/data/models/coin.dart';
import 'package:cryptoviewer/domain/entities/coin.dart';
import 'package:cryptoviewer/domain/entities/coin_history.dart';
import 'package:cryptoviewer/domain/repository_interfaces/coin_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CoinProvider extends ChangeNotifier {
  int number = 0;
  final CoinRepository coinRepository;
  //CoinEntity? currentCoin = null;
  DioError? currentError = null;
  DataState<List<CoinEntity>>? coinListRes;

  DataState<List<CoinHistoryEntity>>? coinHistoryRes;

  //Future<DataState<List<CoinEntity>>>? coinList;
  bool loadingCoins = true;

  bool loadingCoinHistory = false;

  CoinProvider({required this.coinRepository});

  Future<void> getCoinListHistory(
      String assetId, String periodId, int periodDays) async {
    loadingCoinHistory = true;
    notifyListeners();
    coinHistoryRes =
        await coinRepository.getCoinHistory(assetId, periodId, periodDays);
    loadingCoinHistory = false;
    notifyListeners();
  }

  void setLoadingCoins(bool _loading) {
    print("setting loading to ${_loading}");
    loadingCoins = _loading;
    notifyListeners();
  }

  void setLoadingCoinHistory(bool _loading) {
    print("setting loading coin history to ${_loading}");
    loadingCoinHistory = _loading;
    notifyListeners();
  }

  void getCoinList() async {
    print("getting coin list");

    loadingCoins = true;
    notifyListeners();

    coinListRes = await coinRepository.getAllCoinsData();
    /*
    if (coinListRes?.error != null) {
      currentError = coinListRes?.error;
      print("error calling: ${coinListRes?.error}");
    }*/

    loadingCoins = false;
    notifyListeners();
  }
}
