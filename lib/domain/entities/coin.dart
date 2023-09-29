import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable {
  final String name;
  final String assetId;
  final bool typeIsCrypto;
  final String idIcon;
  final double priceUsd;
  final DateTime? firstQuoteDate;
  final DateTime? firstTradeDate;
  final int? numberOfTrades;

  const CoinEntity(
      {required this.name,
      required this.assetId,
      required this.typeIsCrypto,
      required this.idIcon,
      required this.priceUsd,
      required this.firstQuoteDate,
      required this.firstTradeDate,
      required this.numberOfTrades});

  @override
  List<Object?> get props => [
        assetId,
        name,
        priceUsd,
        idIcon,
        typeIsCrypto,
        firstQuoteDate,
        firstTradeDate,
        numberOfTrades
      ];
}
