import 'package:cryptoviewer/core/util/data_state.dart';
import 'package:cryptoviewer/domain/entities/coin.dart';
import 'package:cryptoviewer/domain/entities/coin_history.dart';
import 'package:cryptoviewer/core/util/enums.dart' as enums;

abstract class CoinRepository {
  Future<DataState<List<CoinEntity>>> getAllCoinsData();
  Future<DataState<List<CoinHistoryEntity>>> getCoinHistory(
      String assetId, enums.HistoryMode historyMode);
}
