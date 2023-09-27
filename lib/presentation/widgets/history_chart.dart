import 'dart:math';

import 'package:cryptoviewer/domain/entities/coin_history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  final DateTime date;
  final double rate;
  ChartData(this.date, this.rate);
}

List<List<ChartData>> getChartData(List<CoinHistoryEntity>? history) {
  if (history == null) {
    return [[], [], []];
  } else {
    return [
      history.map((h) => ChartData(h.timeStart, h.rateOpen)).toList(),
      history.map((h) => ChartData(h.timeStart, h.rateClose)).toList(),
      history.map((h) => ChartData(h.timeStart, h.rateHigh)).toList(),
    ];
  }
}

class HistoryChart extends StatefulWidget {
  //List<CoinHistoryEntity>? historyDay;
  List<CoinHistoryEntity>? historyMonth;

  HistoryChart({super.key, required this.historyMonth});

  @override
  State<HistoryChart> createState() => _HistoryChartState();
}

class _HistoryChartState extends State<HistoryChart> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String openLabel = "open rate";
    String closeLabel = "open rate";
    String highLabel = "high rate";
    String chartTitle = "month rates (USD)";

    List<List<ChartData>> chartData = getChartData(widget.historyMonth);

    List<ChartData> openData = chartData[0];
    List<ChartData> closeData = chartData[1];
    List<ChartData> highData = chartData[2];

    return Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        //alignment: Alignment.center,
        height: screenHeight * 0.7,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        width: double.infinity, //screenWidth * 0.9,

        child: SfCartesianChart(
            title: ChartTitle(
                text: chartTitle,
                textStyle: const TextStyle(color: Colors.white, fontSize: 20)),
            tooltipBehavior: TooltipBehavior(
                borderColor: Colors.amber[50],
                borderWidth: 1,
                enable: true,
                shared: true,
                shadowColor: const Color.fromRGBO(0, 0, 0, 0.259)),
            legend: const Legend(
                isVisible: true,
                textStyle: TextStyle(color: Colors.white, fontSize: 10)),
            primaryYAxis: NumericAxis(
                numberFormat: NumberFormat.simpleCurrency(
                  decimalDigits: 3,
                ),
                majorGridLines: MajorGridLines(
                    width: 0.4,
                    color: Theme.of(context).colorScheme.onTertiary)),
            primaryXAxis: DateTimeAxis(
                majorGridLines: MajorGridLines(
                    width: 0.4,
                    color: Theme.of(context).colorScheme.onTertiary),
                intervalType: DateTimeIntervalType.days,
                interval: 3),
            series: <ChartSeries<ChartData, DateTime>>[
              LineSeries<ChartData, DateTime>(
                name: openLabel,
                color: Theme.of(context).colorScheme.primary,
                width: 3,
                dataSource: openData,
                xValueMapper: (ChartData data, _) => data.date,
                yValueMapper: (ChartData data, _) => data.rate,
              ),
              LineSeries<ChartData, DateTime>(
                name: closeLabel,
                color: Colors.pink[300],
                width: 3,
                dataSource: closeData,
                xValueMapper: (ChartData data, _) => data.date,
                yValueMapper: (ChartData data, _) => data.rate,
              ),
              LineSeries<ChartData, DateTime>(
                name: highLabel,
                color: Colors.limeAccent,
                width: 3,
                dataSource: highData,
                xValueMapper: (ChartData data, _) => data.date,
                yValueMapper: (ChartData data, _) => data.rate,
              )
            ]));
  }
}

/*
LineChart(LineChartData(
          maxY: pointsOpen.map((h) => h.y).reduce(max) * 1.05,
          minY: (pointsOpen.map((h) => h.y).reduce(min) * 0.9),
          titlesData: getTitlesDataMonth(),
          borderData: FlBorderData(show: true, border: Border.all(width: 0.5)),
          lineBarsData: [
            LineChartBarData(
                spots: pointsOpen,
                isCurved: true,
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary
                ],
                dotData: FlDotData(show: true)),
          ])),
 */

/*LineChart(
        LineChartData(borderData: FlBorderData(show: false), lineBarsData: [
      LineChartBarData(spots: [
        FlSpot(0, 3),
        FlSpot(2.6, 1),
        FlSpot(4.9, 5),
        FlSpot(6.8, 2.5)
      ]),
    ])) */