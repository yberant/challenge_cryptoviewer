import 'package:cryptoviewer/core/util/data_state.dart';
import 'package:cryptoviewer/domain/entities/coin_history.dart';
import 'package:cryptoviewer/domain/repository_interfaces/coin_repository.dart';

class GetCoinsHistory {
  final CoinRepository respository;
  GetCoinsHistory({required this.respository});

  Future<DataState<List<CoinHistoryEntity>>> call(
      String assetId, String periodId, int periodDays) {
    return respository.getCoinHistory(assetId, periodId, periodDays);
  }
}
