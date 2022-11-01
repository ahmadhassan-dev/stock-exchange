import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/widgets/exchange_tile.dart';
import 'package:stock_exchange/src/feature/market_exchange/search_exchange/viewmodels/search_exchange_viewmodel.dart';
import 'package:stock_exchange/src/utils/constants/color_constants.dart';
import 'package:stock_exchange/src/utils/constants/list_constants.dart';
import 'package:stock_exchange/src/utils/constants/string_constants.dart';

class SearchExchangePage extends StatefulWidget {
  const SearchExchangePage({super.key});

  @override
  State<SearchExchangePage> createState() => _SearchExchangePageState();
}

class _SearchExchangePageState extends State<SearchExchangePage> {
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants().K_CARD_BLACK_COLOR,
      body: ChangeNotifierProvider.value(
          value: GetIt.I.get<SearchExchangeViewModel>(),
          builder: (context, child) {
            final viewModel = context.watch<SearchExchangeViewModel>();
            return SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.0.h,
                    ),
                    _searchBox(viewModel),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    viewModel.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: ListView.separated(
                              itemCount: viewModel.exchanges.length,
                              itemBuilder: (context, index) {
                                if (colorIndex > 2) {
                                  colorIndex = 0;
                                }
                                colorIndex++;
                                return Padding(
                                  padding: const EdgeInsets.only(left: 5, right: 5),
                                  child: ExchangeTile(
                                    nameTxt: viewModel.exchanges[index].name,
                                    // profileImg: imageArray[index],
                                    backColor: ListConstants().COLORS_ARRAY[colorIndex],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 2.0.h,
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _searchBox(SearchExchangeViewModel viewModel) {
    return Container(
      width: 90.w,
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(80)),
        color: ColorConstants().K_BLUE_COLOR,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          _searchField(viewModel),
        ],
      ),
    );
  }

  Widget _searchField(SearchExchangeViewModel viewModel) {
    return Expanded(
        child: TextField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        hintText: StringConstants().SEARCH,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w300,
          color: ColorConstants().BLACK_COLOR.withOpacity(0.7),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.search, size: 32, color: ColorConstants().BLACK_COLOR),
      ),
      enabled: true,
      onChanged: (text) {
        Debouncer(milliseconds: 1000).run(() {
          viewModel.searchExchange(text.trim());
        });
      },
    ));
  }
}

class Debouncer {
  Debouncer({required this.milliseconds});

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
