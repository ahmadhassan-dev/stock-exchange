
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_exchange/src/services/datasource/remote_data_source/remote_data_source.dart';
import 'package:stock_exchange/src/services/repository/repository.dart';
import 'package:stock_exchange/src/services/repository/repository_imp.dart';
import 'package:stock_exchange/src/utils/network/network.dart';
import '../../mocks/mock_constants.dart';
import '../../mocks/mock_network.dart';
import '../../mocks/mock_remote_data_store.dart';

void main() {
  late Repository repository;
  late RemoteDataStore remoteDataStore;
  late NetworkInfo networkInfo;

  setUp(() {
    networkInfo = MockNetworkInfoOnlineImp();
    remoteDataStore = MockRemoteDataStoreImp();
    repository = RepositoryImp(remoteDataStore: remoteDataStore, networkInfo: networkInfo);
  });

  test("get exchanges offline mode", () async {
    final result = await repository.getExchanges();
    expect(result.isLeft(), false);
    expect(result.getOrElse(() => [])[0].toJson(), MOCK_EXCHANGE['data']![0]);
  });

  test("get exchanges with query offline mode", () async {
    final result = await repository.getExchangesUsingQuery(MOCK_QUERY);
    expect(result.isLeft(), false);
    expect(result.getOrElse(() => [])[0].toJson(), MOCK_EXCHANGE['data']![0]);
  });
}
