import 'package:cryptoviewer/domain/entities/coin.dart';
import 'package:flutter/material.dart';

class DataDisplay extends StatelessWidget {
  CoinEntity coin;
  TextStyle dataTextStyle = TextStyle(color: Colors.white, fontSize: 22);

  DataDisplay({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.all(15),
      //alignment: Alignment.center,
      //height: screenHeight * 0.7,
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
          coin.priceUsd >= 0
              ? Text(
                  "Price (USD): \$${coin.priceUsd.toStringAsFixed(3)}",
                  style: dataTextStyle,
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
