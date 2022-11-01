import 'package:flutter/material.dart';
import 'package:stock_exchange/src/feature/market_exchange/common/model/exchange_model.dart';
import 'package:stock_exchange/src/feature/market_exchange/search_exchange/usecase/search_exchange_usecase.dart';
import 'package:stock_exchange/src/utils/extension/extension.dart';

class SearchExchangeViewModel extends ChangeNotifier {
  final SearchExchangeUseCase _searchExchangeUseCase;

  SearchExchangeViewModel(SearchExchangeUseCase searchExchangeUseCase) : _searchExchangeUseCase = searchExchangeUseCase;
  List<ExchangeModel> exchanges = [];
  bool isLoading = false;

  void searchExchange(String query) async {
    isLoading = true;
    notifyListeners();
    final result = await _searchExchangeUseCase(query);
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
