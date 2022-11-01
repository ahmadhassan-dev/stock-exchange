import 'package:flutter/material.dart';
import 'package:stock_exchange/src/feature/market_exchange/common/model/exchange_model.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/usecase/get_exchange_list_usecase.dart';
import 'package:stock_exchange/src/utils/extension/extension.dart';
import 'package:stock_exchange/src/utils/usecase/usecase.dart';

class GetExchangeViewModel extends ChangeNotifier {
  final GetExchangeListUseCase _exchangeListUseCase;

  GetExchangeViewModel(GetExchangeListUseCase useCase) : _exchangeListUseCase = useCase;

  List<ExchangeModel> exchanges = [];
  bool isLoading = true;

  void getExchanges() async {
    final result = await _exchangeListUseCase(NoParams());
    isLoading = false;
    notifyListeners();
    if (result.isLeft()) {
      result.fold((l) => l.message.show(), (r) => null);
      return;
    }
    exchanges = result.getOrElse(() => []);
    notifyListeners();
  }
}
