//valores y objetos para pruebas
import 'package:cryptoviewer/domain/entities/coin.dart';
import 'package:cryptoviewer/domain/entities/coin_history.dart';

Map<String, dynamic> sampleCoinData = {
  "asset_id": "USD",
  "name": "US Dollar",
  "type_is_crypto": 0,
  "data_quote_start": "2014-02-24T00:00:00.0000000Z",
  "data_quote_end": "2023-09-22T00:00:00.0000000Z",
  "data_orderbook_start": "2014-02-24T17:43:05.0000000Z",
  "data_orderbook_end": "2023-07-07T00:00:00.0000000Z",
  "data_trade_start": "2010-07-17T00:00:00.0000000Z",
  "data_trade_end": "2023-09-22T00:00:00.0000000Z",
  "data_symbols_count": 204054,
  "volume_1hrs_usd": 53374447803186.39,
  "volume_1day_usd": 1180852940645280.83,
  "volume_1mth_usd": 0,
  "id_icon": "0a4185f2-1a03-4a7c-b866-ba7076d8c73b",
  "data_start": "2010-07-17",
  "data_end": "2023-09-22"
};

String testAssetId = "TST";

List<Map<String, dynamic>> testListCoinsData = [sampleCoinData];

CoinEntity testCoinEntity = CoinEntity(
    name: 'testcoin',
    assetId: testAssetId,
    typeIsCrypto: false,
    idIcon: 'idicon',
    priceUsd: 1);

List<CoinEntity> testCoinEntityList = [testCoinEntity];
String testPeriodId = "1HRS";
int testPeriodDays = 1;

List<CoinHistoryEntity> testHistory = [
  CoinHistoryEntity(
      assetId: testAssetId,
      timeStart: DateTime.parse("2023-08-29T02:00:00.0000000Z"),
      rateClose: 0.28,
      rateHigh: 0.28,
      rateOpen: 0.28),
  CoinHistoryEntity(
      assetId: testAssetId,
      timeStart: DateTime.parse("2023-08-29T03:00:00.0000000Z"),
      rateClose: 0.28,
      rateHigh: 0.28,
      rateOpen: 0.28),
  CoinHistoryEntity(
      assetId: testAssetId,
      timeStart: DateTime.parse("2023-08-29T04:00:00.0000000Z"),
      rateClose: 0.31,
      rateHigh: 0.31,
      rateOpen: 0.31)
];
/*
    CoinHistoryEntity(assetId: 'TST', timeStartList: [
  DateTime.parse("2023-08-29T02:00:00.0000000Z"),
  DateTime.parse("2023-08-29T03:00:00.0000000Z"),
  DateTime.parse("2023-08-29T03:00:00.0000000Z"),
], rateOpenList: const [
  0.028,
  0.028,
  0.030
], rateHighList: const [
  0.028,
  0.028,
  0.031
], rateCloseList: const [
  0.028,
  0.028,
  0.032
]);*/
