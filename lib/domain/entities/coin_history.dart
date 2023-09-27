import 'package:equatable/equatable.dart';

//TODO: ACTUALIZAR PROPS
class CoinHistoryEntity extends Equatable {
  final DateTime timeStart;
  final double rateOpen;
  final double rateHigh;
  final double rateClose;
  final String assetId;

  CoinHistoryEntity(
      {required this.timeStart,
      required this.rateOpen,
      required this.rateHigh,
      required this.rateClose,
      required this.assetId});

  @override
  // TODO: implement props
  List<Object?> get props => [assetId];
}
