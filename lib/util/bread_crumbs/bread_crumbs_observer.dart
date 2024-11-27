import 'package:flutter/material.dart';

import 'package:front_end_flutter_tracker/bloc/bread_crumbs/bread_crumbs_cubit.dart';
import 'package:front_end_flutter_tracker/sl.dart';

class BreadCrumbObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      DependencyInjectionManager.sl<BreadCrumbsCubit>().refreshCrumbs();
      DependencyInjectionManager.sl<BreadCrumbsCubit>().addBreadCrumb(route.settings.name!, arguments: route.settings.arguments);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if ((previousRoute ?? route).settings.name != null) {
      DependencyInjectionManager.sl<BreadCrumbsCubit>().refreshCrumbs();
      DependencyInjectionManager.sl<BreadCrumbsCubit>().addBreadCrumb((previousRoute ?? route).settings.name!,
          arguments: (previousRoute ?? route).settings.arguments);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute!.settings.name != null) {
      DependencyInjectionManager.sl<BreadCrumbsCubit>().refreshCrumbs();
      DependencyInjectionManager.sl<BreadCrumbsCubit>()
          .addBreadCrumb(newRoute.settings.name!, arguments: newRoute.settings.arguments);
    }
  }
}
