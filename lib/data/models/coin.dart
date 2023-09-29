import 'package:cryptoviewer/domain/entities/coin.dart';

class CoinModel extends CoinEntity {
  CoinModel({
    required super.name,
    required super.assetId,
    required super.typeIsCrypto,
    required super.idIcon,
    required super.priceUsd,
    required super.firstQuoteDate,
    required super.firstTradeDate,
    required super.numberOfTrades,
  });

  factory CoinModel.fromJson(Map<String, dynamic> map) {
    return CoinModel(
        name: map["name"],
        assetId: map["asset_id"],
        typeIsCrypto: map["type_is_crypto"] == 0 ? false : true,
        idIcon: map["id_icon"] != null
            ? map["id_icon"].toString().replaceAll("-", "")
            : "",
        priceUsd: map["asset_id"] == "USD"
            ? 1
            : map["price_usd"] != null
                ? double.parse(map["price_usd"].toString())
                : -1,
        firstQuoteDate: map["data_quote_start"] != null
            ? DateTime.parse(map["data_quote_start"])
            : null,
        firstTradeDate: map["data_trade_start"] != null
            ? DateTime.parse(map["data_trade_start"])
            : null,
        numberOfTrades: map["data_trade_count"]);
  }
}
