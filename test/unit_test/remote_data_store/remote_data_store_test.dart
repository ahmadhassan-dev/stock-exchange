import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_exchange/src/services/datasource/remote_data_source/remote_data_source.dart';
import 'package:stock_exchange/src/services/datasource/remote_data_source/remote_data_source_imp.dart';

import '../../mocks/dio.mocks.dart';
import '../../mocks/logger.mocks.dart';
import '../../mocks/mock_constants.dart';

void main() {
  late RemoteDataStore remoteDataStore;
  late Dio dio;
  late Logger logger;
  setUp(() {
    dio = MockDio();
    logger = MockLogger();
    remoteDataStore = RemoteDatStoreImp(dio: dio, logger: logger);
  });
  test("call get all exchanges", () async {
    when(dio.get("exchanges")).thenAnswer((realInvocation) async {
      return Response(
        statusCode: 200,
        requestOptions: RequestOptions(
          path: "exchanges",
        ),
        data: MOCK_EXCHANGE,
      );
    });
    final response = await remoteDataStore.getExchanges();
    expect((MOCK_EXCHANGE["data"]![0]), response[0].toJson());
  });
}
