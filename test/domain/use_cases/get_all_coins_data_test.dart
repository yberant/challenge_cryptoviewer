import 'package:cryptoviewer/core/util/data_state.dart';
import 'package:cryptoviewer/domain/repository_interfaces/coin_repository.dart';
import 'package:cryptoviewer/domain/use_cases/get_all_coins.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<CoinRepository>()])
import 'get_all_coins_data_test.mocks.dart';
//class MockCoinRepository extends Mock implements CoinRepository {}

import '../../util/test_utils.dart' as testUtils;

void main() {
  GetAllCoinsData? usecase;
  MockCoinRepository? mockCoinRepository;

  final testCoinList = testUtils.testCoinEntityList;

  setUp(() {
    mockCoinRepository = MockCoinRepository();
    usecase = GetAllCoinsData(respository: mockCoinRepository!);
  });

  test('should get coin list', () async {
    when(mockCoinRepository!.getAllCoinsData())
        .thenAnswer((_) async => DataSuccess(testCoinList));

    final result = await usecase!();

    expect(result.data, DataSuccess(testCoinList).data);
    verify(mockCoinRepository!.getAllCoinsData());
    verifyNoMoreInteractions(mockCoinRepository);
  });
}
