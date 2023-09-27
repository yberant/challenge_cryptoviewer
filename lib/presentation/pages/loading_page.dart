import 'package:cryptoviewer/presentation/providers/coin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  String assetId;

  LoadingPage({super.key, required this.assetId});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => context
            .read<CoinProvider>()
            .getCoinListHistory(widget.assetId)
            .then((_) {
          print(context.read<CoinProvider>().loadingCoinHistory);
        }));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Center(
            child: SizedBox(
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
                child: const CircularProgressIndicator(strokeWidth: 15))));
  }
}
