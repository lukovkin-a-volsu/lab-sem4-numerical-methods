import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimpleChart extends StatefulWidget {
  final List<Point<double>> points;
  final String name;

  const SimpleChart({super.key, required this.points, required this.name});

  @override
  State<SimpleChart> createState() => _SimpleChartState();
}

class _SimpleChartState extends State<SimpleChart> {
  late final List<LineChartBarData> data;

  @override
  void initState() {
    data = <LineChartBarData>[
      LineChartBarData(
        spots: widget.points.map((point) => FlSpot(point.x, point.y)).toList(),
        isCurved: true,
        barWidth: 5,
        dotData: const FlDotData(show: true),
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: data,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            axisNameSize: 32,
            axisNameWidget: Text(
              widget.name,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          // bottomTitle: AxisTitle(showTitle: true, titleText: 'X-axis'),
          // leftTitle: AxisTitle(showTitle: true, titleText: 'Y-axis'),
          // topTitle:
          // AxisTitle(showTitle: true, titleText: 'Line Chart with Markers'),
        ),
      ),
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
    );
  }
}
