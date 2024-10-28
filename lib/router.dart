import 'package:front_end_flutter_tracker/presentation/login/login_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router(List<RouteBase> routes) => GoRouter(
    initialLocation: AppRoutes.login,
    routes: routes,
  );

  static final List<RouteBase> routes = [

    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.login,
      builder: (context, state) => const LoginScreen()
    ),

  ];

}

class AppRoutes {

  static const String login = "/login";
  static const String signUp = "/signUp";

}