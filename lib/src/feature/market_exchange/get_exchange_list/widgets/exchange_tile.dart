import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stock_exchange/src/utils/constants/color_constants.dart';

class ExchangeTile extends StatelessWidget {
  final String? profileImg;
  final String? nameTxt;
  final Color? backColor;

  const ExchangeTile({
    Key? key,
    this.profileImg,
    this.nameTxt,
    this.backColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 7.h,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nameTxt!,
            style: Theme.of(context).textTheme.caption?.copyWith(
                  fontSize: 14,
                  color: ColorConstants().BLACK_COLOR,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Nunito-SemiBold",
                ),
          ),
        ],
      ),
    );
  }
}
