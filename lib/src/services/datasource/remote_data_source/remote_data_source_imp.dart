import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:stock_exchange/src/feature/market_exchange/common/model/exchange_model.dart';
import 'package:stock_exchange/src/services/datasource/remote_data_source/remote_data_source.dart';

class RemoteDatStoreImp extends RemoteDataStore {
  final Dio _dio;
  final Logger _logger;

  RemoteDatStoreImp({required Dio dio, required Logger logger})
      : _dio = dio,
        _logger = logger;

  @override
  Future<List<ExchangeModel>> getExchanges() async {
    final response = await _dio.get("exchanges");
    _logger.i("[Exchange Data] ${response.data['data']} ");
    if (response.statusCode == 200) {
      return List.from(response.data['data']).map((e) => ExchangeModel.fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<List<ExchangeModel>> getExchangesByQuery(String query) async {
    final response = await _dio.get("exchanges?search=$query");
    _logger.i("[Exchange Query Data] ${response.data['data']} ");
    if (response.statusCode == 200) {
      return List.from(response.data['data']).map((e) => ExchangeModel.fromJson(e)).toList();
    }
    return [];
  }
}
