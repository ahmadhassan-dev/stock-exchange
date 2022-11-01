import 'package:dartz/dartz.dart';
import 'package:stock_exchange/src/feature/market_exchange/common/model/exchange_model.dart';
import 'package:stock_exchange/src/services/failure/failure.dart';

abstract class Repository {
  /// This use case will get list of exchanges.
  /// Output: Return list of [Exchanges] if operation is successful
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, List<ExchangeModel>>> getExchanges();

  /// This use case will get list of exchanges according to user query.
  /// Output: Return list of [Exchanges] if operation is successful
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, List<ExchangeModel>>> getExchangesUsingQuery(String query);
}
