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

  CoinEntity? currentCoin;

  String coinFilter = "";
  List<CoinEntity> coinListFiltered = [];

  DataState<List<CoinHistoryEntity>>? coinHistoryMonthRes;
  DataState<List<CoinHistoryEntity>>? coinHistoryDayRes;

  //Future<DataState<List<CoinEntity>>>? coinList;
  bool loadingCoins = true;

  bool loadingCoinHistory = false;

  CoinProvider({required this.coinRepository});

  Future<void> getCoinListHistory(String assetId) async {
    loadingCoinHistory = true;
    notifyListeners();
    coinHistoryMonthRes =
        await coinRepository.getCoinHistory(assetId, HistoryMode.month);

    //print("coin history month: ${coinHistoryMonthRes?.data?.length}");
    //coinHistoryDayRes =
    //    await coinRepository.getCoinHistory(assetId, HistoryMode.day);
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

  void SetCurrentCoin(CoinEntity coin) {
    currentCoin = coin;
  }
}
