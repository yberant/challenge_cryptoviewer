import 'package:cryptoviewer/presentation/pages/details_page.dart';
import 'package:cryptoviewer/presentation/pages/list_page.dart';
import 'package:cryptoviewer/presentation/pages/search_page.dart';
import 'package:go_router/go_router.dart';

GoRouter goRoutes = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const ListPage()),
  GoRoute(path: "/coin_details", builder: (context, state) => DetailsPage()),
  GoRoute(path: "/search", builder: (context, state) => SearchPage())
]);
