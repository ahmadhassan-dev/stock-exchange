import 'package:stock_exchange/src/utils/network/network.dart';

import 'mock_constants.dart';

class MockNetworkInfoOfflineImp extends NetworkInfo {
  @override
  Future<bool> get isConnected => Future.value(MOCK_NETWORK_DISCONNECTED);
}

class MockNetworkInfoOnlineImp extends NetworkInfo {
  @override
  Future<bool> get isConnected => Future.value(MOCK_NETWORK_CONNECTED);
}
