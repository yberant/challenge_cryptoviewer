import 'package:cryptoviewer/domain/entities/coin.dart';
import 'package:cryptoviewer/presentation/providers/coin_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CoinSelector extends StatefulWidget {
  CoinEntity coin;

  CoinSelector({super.key, required this.coin});

  @override
  State<CoinSelector> createState() => _CoinSelectorState();
}

class _CoinSelectorState extends State<CoinSelector> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<CoinProvider>(builder: (context, coinProvider, child) {
      return GestureDetector(
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
              color: Colors.black,

              //color: Theme.of(context).colorScheme.surface,
              border: Border.all(
                  color: Theme.of(context).colorScheme.surface, width: 6),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.01, horizontal: screenWidth * 0.01),
          margin: EdgeInsets.symmetric(
              vertical: screenHeight * 0.005, horizontal: screenWidth * 0.02),
          child: Container(
              //height: screenHeight * 0.1,
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.001,
                  horizontal: screenWidth * 0.021),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.coin.name} (${widget.coin.assetId})",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    widget.coin.priceUsd > 0
                        ? "${widget.coin.priceUsd.toStringAsFixed(3)} USD"
                        : "",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              )),
        ),
        onTap: () async {
          coinProvider.setLoadingCoinHistory(true);
          coinProvider.SetCurrentCoin(widget.coin);
          coinProvider.getCoinListHistory(widget.coin.assetId);
          GoRouter.of(context).push("/coin_details");
          //.push("/coin_history/${widget.coin.assetId}/${widget.coin.name}");
          /* coinProvider.getCoinListHistory(widget.coin.assetId, "1HRS", 30);
          print("history:");
          print(coinProvider.coinHistoryRes?.data); */
        },
      );
      //widget.coin.name),
    });
  }
}
