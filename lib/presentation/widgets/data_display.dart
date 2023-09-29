import 'package:cryptoviewer/domain/entities/coin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataDisplay extends StatelessWidget {
  CoinEntity coin;
  TextStyle dataTextStyle = const TextStyle(color: Colors.white, fontSize: 17);

  DataDisplay({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name: ${coin.name}",
            style: dataTextStyle,
          ),
          SizedBox(height: screenHeight * 0.003),
          /* Text(
            "Id: ${coin.assetId}",
            style: dataTextStyle,
          ), */
          coin.firstQuoteDate != null
              ? Text(
                  "First Quote Date: ${DateFormat('yMMMd').format(coin.firstQuoteDate!)}",
                  style: dataTextStyle,
                )
              : const SizedBox.shrink(),
          SizedBox(height: screenHeight * 0.003),
          coin.firstTradeDate != null
              ? Text(
                  "First Trade Date: ${DateFormat('yMMMd').format(coin.firstTradeDate!)}",
                  style: dataTextStyle,
                )
              : const SizedBox.shrink(),
          SizedBox(height: screenHeight * 0.003),
          coin.priceUsd >= 0
              ? Text(
                  "Price (USD): \$${coin.priceUsd.toStringAsFixed(3)}",
                  style: dataTextStyle,
                )
              : const SizedBox.shrink(),
          SizedBox(height: screenHeight * 0.003),
          coin.numberOfTrades != null
              ? Text(
                  "Trades count: ${coin.numberOfTrades}",
                  style: dataTextStyle,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
