import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stock_exchange/src/utils/network/network.dart';

class NetworkInfoImp implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker;

  NetworkInfoImp({required InternetConnectionChecker internetConnectionChecker}) : _connectionChecker = internetConnectionChecker;

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}
