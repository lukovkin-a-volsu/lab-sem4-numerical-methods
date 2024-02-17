import 'dart:math';

import 'package:laboratory_report_1/repositories/chart/models/chart_data.dart';

import 'abstract_chart_repository.dart';

class ChartRepository implements AbstractChartRepository {
  double _f(x) => sqrt(x - 1) * (3 * x + 2) / (4 * x * x);

  List<(double, double)> _differentiate(int a, int b, int N) {
    final h = (b - a) / N;
    var points = <(double, double)>[];
    for (int x = a; x <= b; x++) {
      final y = (_f(x + h) - _f(x)) / h;
      points.add((x.toDouble(), y));
    }
    return points;
  }

  List<(double, double)> _calculate(int a, int b, int N) {
    final h = (b - a) / N;
    var points = <(double, double)>[];
    for (int x = a; x <= b; x++) {
      final y = (_f(x + h) - _f(x)) / h;
      points.add((x.toDouble(), y));
    }
    return points;
  }

  @override
  ChartData chartData1() {
    final records = _differentiate(1, 30, 35);
    final points = records.map((e) => Point(e.$1, e.$2)).toList();
    return ChartData(
      points: points,
      title: 'sqrt(x - 1) * (3x + 2) / (4 * x^2)',
      label: 'Производная первого порядка первой точности',
    );
  }

  @override
  ChartData chartDataDefault() {
    final records = _calculate(1, 30, 35);
    final points = records.map((e) => Point(e.$1, e.$2)).toList();
    return ChartData(
      points: points,
      title: 'sqrt(x - 1) * (3x + 2) / (4 * x^2)',
      label: 'Функция',
    );
  }
}
