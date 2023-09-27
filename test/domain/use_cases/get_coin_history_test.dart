import 'package:cryptoviewer/core/util/data_state.dart';
import 'package:cryptoviewer/core/util/enums.dart';
import 'package:cryptoviewer/domain/repository_interfaces/coin_repository.dart';
import 'package:cryptoviewer/domain/use_cases/get_coins_history.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<CoinRepository>()])
import 'get_coin_history_test.mocks.dart';

import '../../util/test_utils.dart' as testUtils;

void main() {
  GetCoinsHistory? usecase;
  MockCoinRepository? mockCoinRepository;

  final testHistory = testUtils.testHistory;

  setUp(() {
    mockCoinRepository = MockCoinRepository();
    usecase = GetCoinsHistory(respository: mockCoinRepository!);
  });

  test('should get coin history', () async {
    when(mockCoinRepository!
            .getCoinHistory(testUtils.testAssetId, HistoryMode.month))
        .thenAnswer((_) async => DataSuccess(testHistory));

    final result = await usecase!(testUtils.testAssetId, HistoryMode.month);

    expect(result.data, DataSuccess(testHistory).data);
    verify(mockCoinRepository!
        .getCoinHistory(testUtils.testAssetId, HistoryMode.month));
    verifyNoMoreInteractions(mockCoinRepository);
  });
}
