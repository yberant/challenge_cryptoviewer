import 'package:cryptoviewer/domain/entities/coin_history.dart';

//TODO: ACTUALIZAR PROPS
class CoinHistoryModel extends CoinHistoryEntity {
  CoinHistoryModel(
      {required super.timeStart,
      required super.rateOpen,
      required super.rateHigh,
      required super.rateClose,
      required super.assetId});

  factory CoinHistoryModel.fromJson(
      Map<String, dynamic> history, String assetId) {
    return CoinHistoryModel(
        timeStart: DateTime.parse(history["time_period_start"]),
        rateOpen: history["rate_open"],
        rateHigh: history["rate_open"],
        rateClose: history["rate_open"],
        assetId: assetId);
  }
}
