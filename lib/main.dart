import 'package:cryptoviewer/data/data_sources/remote/coins_api_service.dart';
import 'package:cryptoviewer/data/repository_implementations/coin_repository_offline_impl.dart';
import 'package:cryptoviewer/data/repository_implementations/coin_repository_impl.dart';
import 'package:cryptoviewer/domain/repository_interfaces/coin_repository.dart';
import 'package:cryptoviewer/presentation/providers/coin_provider.dart';
import 'package:cryptoviewer/routes.dart' as routes;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //TODO: CAMBIAR LA IMPLEMENTACIÓN DEL REPOSITORIO A LA QUE UTILIZA EL SERVICIO DE LLAMADO A LA API
  // CoinRepository coinRepository = CoinRepositoryOfflineImpl();
  CoinRepository coinRepository = CoinRepositoryImpl(CoinsApiService());
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider(
          create: (_) => CoinProvider(coinRepository: coinRepository))
    ],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: routes.goRoutes,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.amber[800],
              onPrimary: Colors.cyan.shade50,
              secondary: Colors.amber[400],
              surface: const Color.fromARGB(255, 232, 227, 154),
              background: const Color.fromARGB(255, 24, 29, 32),
              tertiary: Color.fromARGB(255, 48, 46, 63),
              onTertiary: Color.fromARGB(255, 31, 30, 41)),

          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: TextTheme(
              displayLarge: TextStyle(color: Colors.amber[400]),
              displayMedium: TextStyle(color: Colors.amber[400]),
              headlineSmall: TextStyle(color: Colors.amber[400]),
              displaySmall: TextStyle(color: Colors.amber[400]),
              labelSmall: TextStyle(color: Colors.amber[400]),
              bodyLarge: TextStyle(color: Colors.amber[400])),
          fontFamily: "Poppins"),
      //home: const ListPage(),
    );
  }
}
