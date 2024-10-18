import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router(List<RouteBase> routes) => GoRouter(
    redirect: (context, state) async {
      
    },
    routes: routes,
  );

  static final List<RouteBase> routes = [

    GoRoute(
      path: '/login',
      name: AppRoutes.login,
      builder: (context, state) => const SizedBox()
    ),

  ];

}

class AppRoutes {

  static const String login = "/login";
  static const String signUp = "/signUp";

}