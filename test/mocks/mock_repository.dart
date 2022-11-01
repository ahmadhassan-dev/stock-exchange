import 'package:dartz/dartz.dart';
import 'package:stock_exchange/src/feature/market_exchange/common/model/exchange_model.dart';
import 'package:stock_exchange/src/services/failure/failure.dart';
import 'package:stock_exchange/src/services/repository/repository.dart';

import 'mock_constants.dart';

class MockRepository extends Repository {
  @override
  Future<Either<Failure, List<ExchangeModel>>> getExchanges() {
    return Future.value(Right([ExchangeModel.fromJson(MOCK_EXCHANGE['data']![0])]));
  }

  @override
  Future<Either<Failure, List<ExchangeModel>>> getExchangesUsingQuery(String query) {
    return Future.value(Right([ExchangeModel.fromJson(MOCK_EXCHANGE['data']![0])]));
  }
}
