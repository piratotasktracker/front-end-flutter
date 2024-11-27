import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:front_end_flutter_tracker/presentation/home/home_screen.dart';
import 'package:front_end_flutter_tracker/presentation/login/login_screen.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/util/bread_crumbs/bread_crumbs_observer.dart';
import 'package:front_end_flutter_tracker/util/shared_preferences_manager.dart';

class AppRouter {

  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: AppRouter._rootNavigatorKey,
    redirect:(context, state) async {
      if(DependencyInjectionManager.sl<SharedPreferencesManager>().getToken()==null){
        return AppRoutes.login;
      }else if(state.fullPath == AppRoutes.login){
        return AppRoutes.home;
      }
      return null;
    },
    initialLocation: AppRoutes.home,
    routes: routes,
  );

  static final List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.login,
      builder: (context, state) => const LoginScreen()
    ),
    ShellRoute(
      navigatorKey: AppRouter._shellNavigatorKey,
      observers: [BreadCrumbObserver()],
      builder: (context, state, child) => HomeScreen(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: AppRoutes.home,
          builder: (context, state) => Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                DependencyInjectionManager.sl<SharedPreferencesManager>().removeToken();
                context.goNamed(AppRoutes.login);
              },
              child: Icon(Icons.abc),
            ),
          )
        ),
      ]
    )

  ];

}

class AppRoutes {

  static const String login = "/login";
  static const String signUp = "/signUp";

  static const String home = '/home';

}