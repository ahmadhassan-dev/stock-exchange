import 'package:flutter/material.dart';
import 'package:stock_exchange/src/app/app.dart';

extension SnackbarToast on String {
  Future show({BuildContext? context}) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context ?? navigatorKey.currentState!.overlay!.context);

    scaffoldMessenger
        .showSnackBar(
          SnackBar(
            content: Text(this),
            duration: const Duration(milliseconds: 1500),
          ),
        )
        .closed
        .then((value) => scaffoldMessenger.clearSnackBars());
  }
}
