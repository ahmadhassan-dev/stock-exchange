import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:stock_exchange/src/feature/market_exchange/common/model/exchange_model.dart';
import 'package:stock_exchange/src/services/datasource/remote_data_source/remote_data_source.dart';
import 'package:stock_exchange/src/services/failure/failure.dart';
import 'package:stock_exchange/src/services/repository/repository.dart';
import 'package:stock_exchange/src/utils/constants/string_constants.dart';
import 'package:stock_exchange/src/utils/network/network.dart';

class RepositoryImp extends Repository {
  final RemoteDataStore _remoteDataStore;
  final NetworkInfo _networkInfo;

  RepositoryImp({required RemoteDataStore remoteDataStore, required NetworkInfo networkInfo})
      : _remoteDataStore = remoteDataStore,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, List<ExchangeModel>>> getExchanges() async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure(StringConstants().NO_INTERNET));
    }
    try {
      return Right(await _remoteDataStore.getExchanges());
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(ServerFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExchangeModel>>> getExchangesUsingQuery(String query) async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure(StringConstants().NO_INTERNET));
    }
    try {
      return Right(await _remoteDataStore.getExchangesByQuery(query));
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(ServerFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
