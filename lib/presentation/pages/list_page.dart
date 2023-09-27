import 'package:cryptoviewer/presentation/providers/coin_provider.dart';
import 'package:cryptoviewer/presentation/widgets/coin_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<CoinProvider>().currentError != null ||
          context.read<CoinProvider>().coinListRes == null ||
          context.read<CoinProvider>().coinListRes?.data == null) {
        context.read<CoinProvider>().getCoinList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    /*
    if (context.read<CoinProvider>().currentError == null) {
      context.read<CoinProvider>().getCoinList();
    }*/

    return Consumer<CoinProvider>(builder: (context, coinProvider, child) {
      //print("loading?: ${coinProvider.loadingCoins}");
      //print("error: ${coinProvider.currentError}");

      return Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              title: const Text("Welcome to CryptoViewer")),
          body: coinProvider.loadingCoins
              ? Center(
                  child: SizedBox(
                      width: screenWidth * 0.3,
                      height: screenWidth * 0.3,
                      child: const CircularProgressIndicator(strokeWidth: 15)))
              : (coinProvider.coinListRes?.error == null &&
                      coinProvider.coinListRes?.data != null)
                  ? Center(
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: coinProvider.coinListRes!.data!
                                  .map((coinData) =>
                                      CoinSelector(coin: coinData))
                                  .toList())),
                    )
                  : Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Text("${coinProvider.loadingCoins}"),
                        Text(
                          "Error: ${coinProvider.coinListRes?.error}",
                          style: Theme.of(context).textTheme.displayLarge,
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                          child: const Text("reintentar"),
                          onPressed: () {
                            //GoRouter.refresh();
                            //context.replace("/");
                            //coinProvider.increase();

                            coinProvider.setLoadingCoins(true);
                            //sleep(Duration(seconds: 1));
                            coinProvider.getCoinList();

                            //coinProvider.setLoading(false);
                          },
                        )
                      ],
                    )));
    });
  }
}
