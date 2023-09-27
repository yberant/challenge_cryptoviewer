import 'package:cryptoviewer/presentation/providers/coin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartPage extends StatefulWidget {
  String assetId;

  ChartPage({super.key, required this.assetId});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("a");
      //context.read<CoinProvider>().setLoadingCoinHistory(true);
      context.read<CoinProvider>().getCoinListHistory(widget.assetId, "1HRS",
          30); //TODO: IMPLELEMTAR OPCIÓN PARA MÁS PERIODOS?
      print("b");
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final coinProvider = Provider.of<CoinProvider>(context);
    //coinProvider.setLoadingCoinHistory(true);
    //coinProvider.getCoinListHistory(widget.assetId, "1HRS", 30);

    return Scaffold(
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
                  ));
  }
}

/*
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
