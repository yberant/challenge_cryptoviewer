import 'package:flutter/material.dart';

class NothingSearched extends StatelessWidget {
  const NothingSearched({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
        child: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    size: screenHeight * 0.22,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.12, right: screenWidth * 0.12),
                    child: Text("Search for an asset\nType its name or id!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 17,
                        )),
                  )
                ])));
  }
}
