import 'package:cryptoviewer/presentation/pages/chart_page.dart';
import 'package:cryptoviewer/presentation/pages/list_page.dart';
import 'package:go_router/go_router.dart';

GoRouter goRoutes = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const ListPage()),
  GoRoute(
      path: "/coin_history",
      //path: "/coin_history/:id/:name",
      builder: (context, state) => ChartPage(
          //assetId: state.pathParameters["id"]!,
          //name: state.pathParameters["name"]!,
          ))
]);
