import 'package:cryptoviewer/core/util/data_state.dart';
import 'package:cryptoviewer/data/data_sources/remote/coins_api_service.dart';
import 'package:cryptoviewer/data/models/coin.dart';
import 'package:cryptoviewer/data/repository_implementations/coin_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
//import 'package:mockito/annotations.dart';
//import 'package:mockito/mockito.dart';
import 'package:cryptoviewer/core/util/values.dart' as values;

import '../../util/test_utils.dart' as test_utils;

//@GenerateNiceMocks([MockSpec<CoinsApiService>()])
//import 'coin_repository_impl_test.mocks.dart';

/*
 pruebas de la implementación del repositorio de monedas
 */
void main() {
  //MockCoinsApiService mockCoinsApiService;
  CoinsApiService coinsApiService;
  CoinRepositoryImpl? coinRepositoryImpl;
  final List<Map<String, dynamic>> testListCoinsData =
      test_utils.testListCoinsData;

  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  setUp(() {
    //mockCoinsApiService = MockCoinsApiService();
    coinsApiService = CoinsApiService();
    coinsApiService.dio = dio;
    coinRepositoryImpl = CoinRepositoryImpl(coinsApiService);
    //testResponse = Response(requestOptions: RequestOptions(path: ""));
  });

  /*
   verifica si el repositorio llama, serializa y devuelve correctamente los datos de monedas solicitados
  */
  test('repository implementation should get coins response', () async {
    //reemplaza la respuesta la llamada de la api por un mock de una respuesta correcta automática. Lo que se busca probar no es el request en sí sinó la implementación del repositorio
    dioAdapter.onGet("${values.baseURL}/${values.getCoinsPath}",
        (request) => request.reply(200, testListCoinsData));
    final response = await coinRepositoryImpl?.getAllCoinsData();
    expect(response, isA<DataSuccess>());
    expect(response?.data, isA<List<CoinModel>>());
  });
}
