import 'package:flutter/material.dart';
import 'package:cryptoviewer/core/util/values.dart' as values;

class IconDisplay extends StatelessWidget {
  String iconId;
  String defaultIconSrc = "assets/images/crypto_icon.png";

  IconDisplay({super.key, required this.iconId});

  String IconUrl() {
    return values.coinIconPath(iconId);
  }

  @override
  Widget build(BuildContext context) {
    print(iconId);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.2,
      height: screenHeight * 0.1,
      margin: const EdgeInsets.all(12),
      //color: Colors.amber,
      child: iconId != "none"
          ? Image.network(IconUrl())
          : Image.asset(defaultIconSrc),
    );
  }
}
