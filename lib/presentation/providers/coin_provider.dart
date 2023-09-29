import 'package:cryptoviewer/core/util/data_state.dart';
import 'package:cryptoviewer/core/util/enums.dart';
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

  List<CoinEntity> filteredCoins = [];

  CoinEntity? currentCoin;

  String coinSearchQuery = "";

  DataState<List<CoinHistoryEntity>>? coinHistoryRes;

  bool loadingCoins = true;

  bool loadingCoinHistory = false;

  CoinProvider({required this.coinRepository});

  String processString(String str) => str.toLowerCase().trim();

  Future<void> getCoinListHistory(String assetId) async {
    loadingCoinHistory = true;
    notifyListeners();
    coinHistoryRes =
        await coinRepository.getCoinHistory(assetId, HistoryMode.month);
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

    loadingCoins = false;
    notifyListeners();
  }

  void setCoinSearchQuery(String query) {
    coinSearchQuery = query;
    notifyListeners();
  }

  void SetCurrentCoin(CoinEntity coin) {
    currentCoin = coin;
    notifyListeners();
  }
}
