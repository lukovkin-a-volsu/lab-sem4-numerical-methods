import 'dart:math';

import 'package:laboratory_report_1/repositories/chart/models/chart_data.dart';

import 'abstract_chart_repository.dart';

class ChartRepository implements AbstractChartRepository {
  List<Point<double>> _listsToPoints(List<double> a, List<double> b) {
    final length = min(a.length, b.length);
    var points = <Point<double>>[];
    for (int i = 0; i < length; i++) {
      points.add(Point(a[i], b[i]));
    }
    return points;
  }

  @override
  ChartData chartData1() {
    final points = _listsToPoints([-2, -1, 0, 1, 2], [4, 1, 0, 1, 4]);

    return ChartData(
      points: points,
      label: 'first',
    );
  }

  @override
  ChartData chartData2() {
    final points = _listsToPoints([-2, -1, 0, 1, 2], [-2, -1, 0, 1, 2]);

    return ChartData(
      points: points,
      label: 'second',
    );
  }

  @override
  ChartData chartData3() {
    final points =
        _listsToPoints([-3, -2, -1, 0, 1, 2, 3], [-27, -8, -1, 0, 1, 8, 27]);

    return ChartData(
      points: points,
      label: 'third',
    );
  }
}
