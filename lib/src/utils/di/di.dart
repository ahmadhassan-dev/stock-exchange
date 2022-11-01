import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:stock_exchange/src/config/config.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/usecase/get_exchange_list_usecase.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/viewmodel/get_exchange_viewmodel.dart';
import 'package:stock_exchange/src/feature/market_exchange/search_exchange/usecase/search_exchange_usecase.dart';
import 'package:stock_exchange/src/feature/market_exchange/search_exchange/viewmodels/search_exchange_viewmodel.dart';
import 'package:stock_exchange/src/services/datasource/remote_data_source/remote_data_source.dart';
import 'package:stock_exchange/src/services/datasource/remote_data_source/remote_data_source_imp.dart';
import 'package:stock_exchange/src/services/repository/repository.dart';
import 'package:stock_exchange/src/services/repository/repository_imp.dart';
import 'package:stock_exchange/src/utils/network/network.dart';
import 'package:stock_exchange/src/utils/network/network_imp.dart';

final sl = GetIt.I;

Future<void> init() async {
  /// External Dependencies
  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: "http://api.marketstack.com/v1/",
        queryParameters: {
          "access_key": apiKey,
        },
      ),
    ),
  );
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Logger());

  ///Services
  sl.registerLazySingleton<RemoteDataStore>(() => RemoteDatStoreImp(dio: sl(), logger: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(internetConnectionChecker: sl()));

  ///Repository
  sl.registerLazySingleton<Repository>(() => RepositoryImp(networkInfo: sl(), remoteDataStore: sl()));

  ///UseCases
  sl.registerLazySingleton(() => GetExchangeListUseCase(sl()));
  sl.registerLazySingleton(() => SearchExchangeUseCase(sl()));

  ///viewModels
  sl.registerLazySingleton(() => GetExchangeViewModel(sl()));
  sl.registerLazySingleton(() => SearchExchangeViewModel(sl()));
}
