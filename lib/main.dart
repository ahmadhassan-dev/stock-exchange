import 'package:flutter/material.dart';
import 'package:stock_exchange/src/app/app.dart';
import 'src/utils/di/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}
