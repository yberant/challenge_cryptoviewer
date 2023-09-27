import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable {
  final String name;
  final String assetId;
  final bool typeIsCrypto;
  final String idIcon;
  final double priceUsd;

  CoinEntity(
      {required this.name,
      required this.assetId,
      required this.typeIsCrypto,
      required this.idIcon,
      required this.priceUsd});

  @override
  List<Object?> get props => [assetId, name, priceUsd, idIcon, typeIsCrypto];
}
