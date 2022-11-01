import 'package:dartz/dartz.dart';
import 'package:stock_exchange/src/feature/market_exchange/common/model/exchange_model.dart';
import 'package:stock_exchange/src/services/failure/failure.dart';
import 'package:stock_exchange/src/services/repository/repository.dart';
import 'package:stock_exchange/src/utils/usecase/usecase.dart';

class GetExchangeListUseCase extends UseCase<List<ExchangeModel>, NoParams> {
  final Repository _repository;

  GetExchangeListUseCase(Repository repository) : _repository = repository;

  @override
  Future<Either<Failure, List<ExchangeModel>>> call(NoParams params) {
    return _repository.getExchanges();
  }
}
