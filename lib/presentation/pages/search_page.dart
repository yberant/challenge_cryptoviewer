import 'package:cryptoviewer/domain/entities/coin.dart';
import 'package:cryptoviewer/presentation/providers/coin_provider.dart';
import 'package:cryptoviewer/presentation/widgets/coin_selector.dart';
import 'package:cryptoviewer/presentation/widgets/nothing_found.dart';
import 'package:cryptoviewer/presentation/widgets/nothing_searched.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  final textController = TextEditingController();
  SearchPage({super.key});

  String processString(String str) => str.toLowerCase().trim();

  @override
  Widget build(BuildContext context) {
    return Consumer<CoinProvider>(builder: (context, coinProvider, child) {
      List<CoinEntity> filteredCoins = coinProvider.coinSearchQuery == ""
          ? []
          : coinProvider.coinListRes!.data!
              .where((coin) => (processString(coin.name).startsWith(
                      processString(coinProvider.coinSearchQuery)) ||
                  processString(coin.assetId)
                      .startsWith(processString(coinProvider.coinSearchQuery))))
              .toList();

      return Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              title: Center(
                  child: TextField(
                controller: textController,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  coinProvider.setCoinSearchQuery(value);
                },
                decoration: InputDecoration(
                    hintText: 'Search Here',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        coinProvider.setCoinSearchQuery("");
                        textController.clear();
                      },
                    )),
              ))),
          body: (coinProvider.coinSearchQuery == "")
              ? const NothingSearched()
              : filteredCoins.length > 0
                  ? SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: filteredCoins
                              .map((coinData) => CoinSelector(coin: coinData))
                              .toList()))
                  : const NothingFound());
    });
  }
}
