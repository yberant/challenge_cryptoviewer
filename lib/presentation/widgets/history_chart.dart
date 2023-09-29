import 'dart:math';

import 'package:cryptoviewer/domain/entities/coin_history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      history.map((h) => ChartData(h.timeStart!, h.rateOpen!)).toList(),
      history.map((h) => ChartData(h.timeStart!, h.rateClose!)).toList(),
      history.map((h) => ChartData(h.timeStart!, h.rateHigh!)).toList(),
    ];
  }
}

class HistoryChart extends StatelessWidget {
  List<CoinHistoryEntity>? historyMonth;

  HistoryChart({super.key, required this.historyMonth});

  @override
  Widget build(BuildContext context) {
    if (this.historyMonth?.length == 0) {
      return const SizedBox.shrink();
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String openLabel = "open rate";
    String closeLabel = "open rate";
    String highLabel = "high rate";
    String chartTitle = "month rates (USD)";

    List<List<ChartData>> chartData = getChartData(historyMonth);

    List<ChartData> openData = chartData[0];
    List<ChartData> closeData = chartData[1];
    List<ChartData> highData = chartData[2];

    return Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        height: screenHeight * 0.6,
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
                maximum: [
                      openData.map((d) => d.rate).toList().reduce(max),
                      closeData.map((d) => d.rate).toList().reduce(max),
                      highData.map((d) => d.rate).toList().reduce(max)
                    ].reduce(max) *
                    1.05,
                minimum: [
                      openData.map((d) => d.rate).toList().reduce(min),
                      closeData.map((d) => d.rate).toList().reduce(min),
                      highData.map((d) => d.rate).toList().reduce(min)
                    ].reduce(min) *
                    0.9,
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
