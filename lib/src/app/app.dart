import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/screens/get_exchanges_list.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/viewmodel/get_exchange_viewmodel.dart';
import 'package:stock_exchange/src/feature/market_exchange/search_exchange/screen/search_exchange_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => GetIt.I.get<GetExchangeViewModel>()),
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
    });
  }
}
