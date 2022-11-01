import 'package:dartz/dartz.dart';
import 'package:stock_exchange/src/feature/market_exchange/common/model/exchange_model.dart';
import 'package:stock_exchange/src/services/failure/failure.dart';
import 'package:stock_exchange/src/services/repository/repository.dart';
import 'package:stock_exchange/src/utils/usecase/usecase.dart';

class SearchExchangeUseCase extends UseCase<List<ExchangeModel>, String> {
  final Repository _repository;

  SearchExchangeUseCase(Repository repository) : _repository = repository;

  @override
  Future<Either<Failure, List<ExchangeModel>>> call(String params) async {
    return await _repository.getExchangesUsingQuery(params);
  }
}
