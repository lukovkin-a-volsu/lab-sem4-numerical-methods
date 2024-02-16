import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:laboratory_report_1/app.dart';
import 'package:laboratory_report_1/repositories/chart/chart.dart';

void main() {
  GetIt.I
      .registerLazySingleton<AbstractChartRepository>(() => ChartRepository());
  runApp(const App());
}
