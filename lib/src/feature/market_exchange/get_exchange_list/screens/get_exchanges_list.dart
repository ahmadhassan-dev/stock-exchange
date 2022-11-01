import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/viewmodel/get_exchange_viewmodel.dart';
import 'package:stock_exchange/src/feature/market_exchange/get_exchange_list/widgets/exchange_tile.dart';
import 'package:stock_exchange/src/utils/common_widgets/my_text.dart';
import 'package:stock_exchange/src/utils/constants/asset_constants.dart';
import 'package:stock_exchange/src/utils/constants/color_constants.dart';
import 'package:stock_exchange/src/utils/constants/list_constants.dart';
import 'package:stock_exchange/src/utils/constants/string_constants.dart';

class GetExchangeList extends StatefulWidget {
  const GetExchangeList({Key? key}) : super(key: key);

  @override
  State<GetExchangeList> createState() => _GetExchangeListState();
}

class _GetExchangeListState extends State<GetExchangeList> {
  @override
  void initState() {
    super.initState();
    context.read<GetExchangeViewModel>().getExchanges();
  }

  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<GetExchangeViewModel>();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstants().K_CARD_BLACK_COLOR,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: ColorConstants().K_CARD_BLACK_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    "Hello, Ahmad",
                    fontSize: 25,
                    color: ColorConstants().WHITE_COLOR,
                    fontWeight: FontWeight.w700,
                  ),
                  IconButton(
                    key: Key(StringConstants().K_SEARCH_ICON_KEY),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/search');
                    },
                    icon: Icon(
                      Icons.search,
                      color: ColorConstants().WHITE_COLOR,
                      size: 22.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3.0.h,
              ),
              Card(
                color: ColorConstants().K_SCREEN_BLACK_COLOR,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  height: 12.0.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w, right: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 6.h,
                                  width: 6.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: ColorConstants().WHITE_COLOR,
                                      width: 2,
                                    ),
                                    image: DecorationImage(
                                      image: ExactAssetImage(
                                        AssetConstants().MY_PIC,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 2.h,
                                    width: 2.h,
                                    decoration: BoxDecoration(
                                      color: ColorConstants().GREEN_COLOR,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: ColorConstants().WHITE_COLOR,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 5.0.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  "Your Balance",
                                  fontSize: 11,
                                  color: ColorConstants().K_PRIMARY_COLOR,
                                ),
                                MyText(
                                  "\$23,052.82",
                                  fontSize: 18,
                                  color: ColorConstants().WHITE_COLOR,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 4.w,
                          color: ColorConstants().WHITE_COLOR,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    "Exchanges",
                    fontSize: 18,
                    color: ColorConstants().WHITE_COLOR,
                    fontWeight: FontWeight.w700,
                  ),
                  MyText(
                    "See all",
                    color: ColorConstants().K_PRIMARY_COLOR,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: 2.0.h,
              ),
              viewModel.isLoading == true
                  ? const Center(child: CircularProgressIndicator())
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
      ),
    );
  }
}
