import 'package:crossword_cracker/views/home/route/route.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _instance = AppRouter._();

  final router = GoRouter(
    initialLocation: '/',
    routes: $appRoutes,
  );

  AppRouter._();

  factory AppRouter() {
    return _instance;
  }

  String get path {
    return router.routeInformationProvider.value.uri.path;
  }
}
