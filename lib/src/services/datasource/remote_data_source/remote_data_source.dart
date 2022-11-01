import 'package:stock_exchange/src/feature/market_exchange/common/model/exchange_model.dart';

abstract class RemoteDataStore {
  ///This method is used to get list of [Exchanges]
  ///Output: List of [Exchanges] will return based on user input
  Future<List<ExchangeModel>> getExchanges();

  ///This method is used to get list of [Exchanges] according to search
  ///Input: [Query] user enter for search specific exchange
  ///Output: List of [Exchanges] will return based on user input
  Future<List<ExchangeModel>> getExchangesByQuery(String query);
}
