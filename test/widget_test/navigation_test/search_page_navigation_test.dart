import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:stock_exchange/src/app/app.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/screens/get_exchanges_list.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/usecase/get_exchange_list_usecase.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/viewmodel/get_exchange_viewmodel.dart';
import 'package:stock_exchange/src/feature/market_exchange/search_exchange/screen/search_exchange_screen.dart';
import 'package:stock_exchange/src/feature/market_exchange/search_exchange/usecase/search_exchange_usecase.dart';
import 'package:stock_exchange/src/feature/market_exchange/search_exchange/viewmodels/search_exchange_viewmodel.dart';
import 'package:stock_exchange/src/services/repository/repository.dart';
import 'package:stock_exchange/src/utils/constants/string_constants.dart';

import '../../mocks/mock_repository.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  late Repository repository;
  late GetExchangeListUseCase getExchangeListUseCase;
  late GetExchangeViewModel viewModel;
  late SearchExchangeUseCase searchExchangeUseCase;

  setUp(() {
    repository = MockRepository();
    getExchangeListUseCase = GetExchangeListUseCase(repository);
    viewModel = GetExchangeViewModel(getExchangeListUseCase);
    searchExchangeUseCase = SearchExchangeUseCase(repository);
    GetIt.I.registerLazySingleton(() => SearchExchangeViewModel(searchExchangeUseCase));
  });
  testWidgets("testcase for checking navigation from home page to search page", (tester) async {
    await tester.pumpWidget(
      Sizer(
        builder: (context, orientation, deviceType) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => viewModel),
            ],
            child: MaterialApp(
              navigatorKey: navigatorKey,
              initialRoute: '/',
              routes: {
                '/': (context) => const GetExchangeList(),
                '/search': (context) => const SearchExchangePage(),
              },
            ),
          );
        },
      ),
    );
    final searchIcon = find.byKey(Key(StringConstants().K_SEARCH_ICON_KEY));
    expect(searchIcon, findsOneWidget);
    expect(find.byType(SearchExchangePage), findsNothing);
    await tester.tap(searchIcon);
    await tester.pumpAndSettle();
    expect(find.byType(SearchExchangePage), findsOneWidget);
    expect(find.text(StringConstants().SEARCH), findsOneWidget);
  });
}
