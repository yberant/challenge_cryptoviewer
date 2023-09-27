import 'package:cryptoviewer/core/util/data_state.dart';
import 'package:cryptoviewer/data/data_sources/remote/coins_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

/*
  pruebas del servicio que hace las requests a la api
*/
void main() {
  CoinsApiService? coinsApiService;
  String? assetId;
  String? periodId;
  int? periodDays;

  setUp(() {
    coinsApiService = CoinsApiService();
    assetId = "BTC";
    periodId = "1HRS";
    periodDays = 30;
  });

  /*
   verifica si el servicio hace correctamente la request para obtener la lista de monedas
   */

  test('should query coins', () async {
    Response result = await coinsApiService!.getAllCoins();

    expect(result.data.length, greaterThan(0));
    expect(result.statusCode, 200);
    expect(result.statusMessage, "OK");
  });

  /*
   verifica si el servicio hace correctamente la request para obtener la lista valores históricos de un mes (lapso de una hora) del asset BTC
   */

  test('should query BTC asset history', () async {
    Response? result;
    result = await coinsApiService!
        .getCoinsHistory(assetId!, periodId!, periodDays!);

    expect(result.data.length, greaterThan(0));
    expect(result.statusCode, 200);
    expect(result.statusMessage, "OK");
  });
}
