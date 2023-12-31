// Mocks generated by Mockito 5.4.2 from annotations
// in cryptoviewer/test/domain/use_cases/get_all_coins_data_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cryptoviewer/core/util/data_state.dart' as _i2;
import 'package:cryptoviewer/core/util/enums.dart' as _i7;
import 'package:cryptoviewer/domain/entities/coin.dart' as _i5;
import 'package:cryptoviewer/domain/entities/coin_history.dart' as _i6;
import 'package:cryptoviewer/domain/repository_interfaces/coin_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDataState_0<T> extends _i1.SmartFake implements _i2.DataState<T> {
  _FakeDataState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CoinRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoinRepository extends _i1.Mock implements _i3.CoinRepository {
  @override
  _i4.Future<_i2.DataState<List<_i5.CoinEntity>>> getAllCoinsData() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllCoinsData,
          [],
        ),
        returnValue: _i4.Future<_i2.DataState<List<_i5.CoinEntity>>>.value(
            _FakeDataState_0<List<_i5.CoinEntity>>(
          this,
          Invocation.method(
            #getAllCoinsData,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.DataState<List<_i5.CoinEntity>>>.value(
                _FakeDataState_0<List<_i5.CoinEntity>>(
          this,
          Invocation.method(
            #getAllCoinsData,
            [],
          ),
        )),
      ) as _i4.Future<_i2.DataState<List<_i5.CoinEntity>>>);
  @override
  _i4.Future<_i2.DataState<List<_i6.CoinHistoryEntity>>> getCoinHistory(
    String? assetId,
    _i7.HistoryMode? historyMode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCoinHistory,
          [
            assetId,
            historyMode,
          ],
        ),
        returnValue:
            _i4.Future<_i2.DataState<List<_i6.CoinHistoryEntity>>>.value(
                _FakeDataState_0<List<_i6.CoinHistoryEntity>>(
          this,
          Invocation.method(
            #getCoinHistory,
            [
              assetId,
              historyMode,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.DataState<List<_i6.CoinHistoryEntity>>>.value(
                _FakeDataState_0<List<_i6.CoinHistoryEntity>>(
          this,
          Invocation.method(
            #getCoinHistory,
            [
              assetId,
              historyMode,
            ],
          ),
        )),
      ) as _i4.Future<_i2.DataState<List<_i6.CoinHistoryEntity>>>);
}
