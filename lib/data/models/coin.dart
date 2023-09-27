import 'package:cryptoviewer/domain/entities/coin.dart';

class CoinModel extends CoinEntity {
  CoinModel(
      {required super.name,
      required super.assetId,
      required super.typeIsCrypto,
      required super.idIcon,
      required super.priceUsd});

  factory CoinModel.fromJson(Map<String, dynamic> map) {
    return CoinModel(
        name: map["name"],
        assetId: map["asset_id"],
        typeIsCrypto: map["type_is_crypto"] == 0 ? true : false,
        idIcon: map["id_icon"] ?? "none",
        priceUsd: map["asset_id"] == "USD" ? 1 : (map["price_usd"]) ?? -1);
  }
}
