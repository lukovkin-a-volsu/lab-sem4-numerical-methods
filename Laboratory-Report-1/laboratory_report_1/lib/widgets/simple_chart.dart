import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:laboratory_report_1/repositories/chart/chart.dart';

class SimpleChart extends StatefulWidget {
  final List<ChartData> chartsData;

  const SimpleChart({super.key, required this.chartsData});

  @override
  State<SimpleChart> createState() => _SimpleChartState();
}

class _SimpleChartState extends State<SimpleChart> {
  late final List<LineChartBarData> lineChartBarData;
  late final List<LineChartData> lineChartData;

  @override
  void initState() {
    lineChartBarData = widget.chartsData
        .map(
          (chartData) => LineChartBarData(
            spots: chartData.points
                .map((point) => FlSpot(point.x, point.y))
                .toList(),
            isCurved: true,
            barWidth: 5,
            dotData: const FlDotData(show: true),
          ),
        )
        .toList();

    lineChartData = lineChartBarData
        .map(
          (e) => LineChartData(
            lineBarsData: lineChartBarData,
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(
                axisNameSize: 32,
                axisNameWidget: Text(
                  widget.chartsData[0].title,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              bottomTitles: AxisTitles(
                axisNameSize: 32,
                axisNameWidget: Text(
                  widget.chartsData[0].label,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            gridData: FlGridData(
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: value != 0 ? Colors.blueGrey : Colors.red,
                  strokeWidth: value != 0 ? 0.4 : 1.2,
                  dashArray: [8, 4],
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: value != 0 ? Colors.blueGrey : Colors.red,
                  strokeWidth: value != 0 ? 0.4 : 1.2,
                  dashArray: [8, 4],
                );
              },
            ),
          ),
        )
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      lineChartData[0],
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
    );
  }
}
