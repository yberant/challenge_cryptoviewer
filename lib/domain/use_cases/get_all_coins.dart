import 'package:cryptoviewer/core/util/data_state.dart';
import 'package:cryptoviewer/domain/entities/coin.dart';
import 'package:cryptoviewer/domain/repository_interfaces/coin_repository.dart';

class GetAllCoinsData {
  final CoinRepository respository;
  GetAllCoinsData({required this.respository});

  Future<DataState<List<CoinEntity>>> call() {
    return respository.getAllCoinsData();
  }
}
