import 'package:equatable/equatable.dart';

class CoinHistoryEntity extends Equatable {
  final DateTime timeStart;
  final double rateOpen;
  final double rateHigh;
  final double rateClose;
  final String assetId;

  const CoinHistoryEntity(
      {required this.timeStart,
      required this.rateOpen,
      required this.rateHigh,
      required this.rateClose,
      required this.assetId});

  @override
  List<Object?> get props =>
      [timeStart, rateOpen, rateHigh, rateClose, assetId];
}
