import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:laboratory_report_1/repositories/chart/chart.dart';
import 'package:laboratory_report_1/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<SimpleChart> simpleCharts;

  @override
  void initState() {
    simpleCharts = [
      SimpleChart(
        chartsData: [
          GetIt.I<AbstractChartRepository>().chartData1(),
          GetIt.I<AbstractChartRepository>().chartDataDefault(),
        ],
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: simpleCharts.length,
                  (context, index) => simpleCharts[index],
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
