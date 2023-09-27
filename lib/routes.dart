import 'package:cryptoviewer/presentation/pages/chart_page.dart';
import 'package:cryptoviewer/presentation/pages/list_page.dart';
import 'package:cryptoviewer/presentation/pages/loading_page.dart';
import 'package:go_router/go_router.dart';

GoRouter goRoutes = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => ListPage()),
  GoRoute(
      path: "/loading/:id",
      builder: (context, state) =>
          LoadingPage(assetId: state.pathParameters["id"]!)),
  GoRoute(
      path: "/coin_history/:id",
      builder: (context, state) =>
          ChartPage(assetId: state.pathParameters["id"]!))
]);
