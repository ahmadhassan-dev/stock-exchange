import 'package:stock_exchange/src/feature/market_exchange/common/model/exchange_model.dart';
import 'package:stock_exchange/src/services/datasource/remote_data_source/remote_data_source.dart';

import 'mock_constants.dart';

class MockRemoteDataStoreImp extends RemoteDataStore {
  @override
  Future<List<ExchangeModel>> getExchanges() {
    return Future.value([ExchangeModel.fromJson(MOCK_EXCHANGE['data']![0])]);
  }

  @override
  Future<List<ExchangeModel>> getExchangesByQuery(String query) {
    return Future.value([ExchangeModel.fromJson(MOCK_EXCHANGE['data']![0])]);
  }
}
