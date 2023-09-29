import 'package:cryptoviewer/presentation/providers/coin_provider.dart';
import 'package:cryptoviewer/presentation/widgets/data_display.dart';
import 'package:cryptoviewer/presentation/widgets/history_chart.dart';
import 'package:cryptoviewer/presentation/widgets/icon_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  //String assetId;
  //String name;

  DetailsPage({super.key /*, required this.assetId, required this.name*/});

  @override
  State<DetailsPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<DetailsPage> {
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
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final coinProvider = Provider.of<CoinProvider>(context, listen: true);

    historyLoading = coinProvider.loadingCoinHistory;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
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
                        historyMonth: coinProvider.coinHistoryRes?.data,
                      ),
                    ],
                  ))
                : Text(
                    "Error: ${coinProvider.coinHistoryRes?.error}",
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ));
  }
}
