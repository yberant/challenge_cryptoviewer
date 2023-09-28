import 'dart:async';
import 'dart:io';

import 'package:cryptoviewer/presentation/pages/list_page.dart';
import 'package:cryptoviewer/presentation/providers/coin_provider.dart';
import 'package:cryptoviewer/presentation/widgets/data_display.dart';
import 'package:cryptoviewer/presentation/widgets/history_chart.dart';
import 'package:cryptoviewer/presentation/widgets/icon_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/scheduler.dart';

class ChartPage extends StatefulWidget {
  //String assetId;
  //String name;

  ChartPage({super.key /*, required this.assetId, required this.name*/});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  late bool historyLoading;

  @override
  void initState() {
    super.initState();
    historyLoading = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      String currentAssetId = Provider.of<CoinProvider>(context, listen: false)
          .currentCoin!
          .assetId;

      Provider.of<CoinProvider>(context, listen: false)
          .getCoinListHistory(currentAssetId);
    });

    /*Provider.of<CoinProvider>(context, listen: false)
        .getCoinListHistory(widget.assetId, "1HRS", 30);*/
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final coinProvider = Provider.of<CoinProvider>(context, listen: true);

    historyLoading = coinProvider.loadingCoinHistory;

    //coinProvider.setLoadingCoinHistory(true);
    //coinProvider.getCoinListHistory(widget.assetId, "1HRS", 30);
    print("building");

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text(
              "${coinProvider.currentCoin?.name} (${coinProvider.currentCoin?.name})"),
        ),
        body: coinProvider.loadingCoinHistory
            ? Center(
                child: SizedBox(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    child: const CircularProgressIndicator(strokeWidth: 15)))
            : (coinProvider.coinListRes?.error == null &&
                    coinProvider.coinListRes?.data != null)
                ? SingleChildScrollView(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconDisplay(iconId: coinProvider.currentCoin!.idIcon),
                      DataDisplay(coin: coinProvider.currentCoin!),
                      HistoryChart(
                        historyMonth: coinProvider.coinHistoryMonthRes?.data,
                      ),
                    ],
                  ))

                /*Text("${widget.assetId} * ${coinProvider.loadingCoinHistory}",
                    style: Theme.of(context).textTheme.displayLarge)*/
                : Text(
                    "Error: ${coinProvider.coinHistoryMonthRes?.error}",
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  )); /*Scaffold(
        body: coinProvider.loadingCoinHistory
            ? Center(
                child: SizedBox(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    child: const CircularProgressIndicator(strokeWidth: 15)))
            : (coinProvider.coinListRes?.error == null &&
                    coinProvider.coinListRes?.data != null)
                ? Text("${widget.assetId} * ${coinProvider.loadingCoinHistory}",
                    style: Theme.of(context).textTheme.displayLarge)
                : Text(
                    "Error: ${coinProvider.coinHistoryRes?.error}",
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ));*/
  }
}

/*
//with future:
FutureBuilder(
      future: coinProvider.coinHistoryRes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SizedBox(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3,
                  child: const CircularProgressIndicator(strokeWidth: 15)));
        } else {
          if (snapshot.hasError) {
            return Text(
              "Error: ${snapshot.error}",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            );
          } else if (snapshot.data?.error != null) {
            return Text(
              "Error: ${snapshot.data?.error}",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            );
          } else {
            return Text("${widget.assetId} * ${snapshot.data?.data?.length}",
                style: Theme.of(context).textTheme.displayLarge);
          }
        }
      },
    )

 */

/*
without future
Scaffold(
        body: coinProvider.loadingCoinHistory
            ? Center(
                child: SizedBox(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    child: const CircularProgressIndicator(strokeWidth: 15)))
            : (coinProvider.coinListRes?.error == null &&
                    coinProvider.coinListRes?.data != null)
                ? Text("${widget.assetId} * ${coinProvider.loadingCoinHistory}",
                    style: Theme.of(context).textTheme.displayLarge)
                : Text(
                    "Error: ${coinProvider.coinHistoryRes?.error}",
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ));*/
