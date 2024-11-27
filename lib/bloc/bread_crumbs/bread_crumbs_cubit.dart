import 'package:bloc/bloc.dart';

import 'package:front_end_flutter_tracker/bloc/bread_crumbs/bread_crumbs_state.dart';
import 'package:front_end_flutter_tracker/util/bread_crumbs/bread_crumb_model.dart';

class BreadCrumbsCubit extends Cubit<BreadCrumbsState>{
  BreadCrumbsCubit() : super(const BreadCrumbsState(
    breadCrumbs: [], 
    previousBreadCrumbs: []
  ));

  String navigateToCrumb(int breadPopsCount){
    String path = '';
    for(int i = 0; breadPopsCount > i; i++) {
      path += '${state.breadCrumbs[i].name?.toLowerCase()}/';
    }
    return path;
  }

  void addBreadCrumb(String path, {Object? arguments}) {
    int i = 0;

    final (name, route) = _initOverrideRoute(arguments);

    String? overrideRouteName = name;
    String? overrideOverrideRoute = route;

    final breadCrumbItems = List.of(state.breadCrumbs);
    while (path.isNotEmpty) {
      final (oldOverrideName, overridePath) = _receiveOldOverrideName(i);
      i++;
      if (path.indexOf('/') != path.lastIndexOf('/')) {
        path = path.substring(1);
        final name = path.substring(0, path.indexOf('/'));
        final localizedName = name;
        final hasOverrideRoute = overrideRouteName != null &&
            overrideOverrideRoute != null &&
            overrideOverrideRoute == name;
        final namePath = oldOverrideName != null && overridePath == name  ? overridePath : name;
        final hasOverride = oldOverrideName != null && overridePath == name;
        final newBreadCrumb = BreadCrumbModel(
          name: namePath,
          localizedName: hasOverride ? oldOverrideName : (hasOverrideRoute ? overrideRouteName : localizedName),
          pops: i,
        );

        breadCrumbItems.add(newBreadCrumb);
        path = path.substring(path.indexOf('/'));
      } else {
        final name = path.substring(path.indexOf('/') + 1);
        final localizedName = name;
        final hasOverrideRoute = overrideRouteName != null &&
            overrideOverrideRoute != null &&
            overrideOverrideRoute == name;
        final namePath = oldOverrideName != null && overridePath == name ? overridePath : name;
        final hasOverride = oldOverrideName != null && overridePath == name;
        final newBreadCrumb = BreadCrumbModel(
          name: namePath,
          localizedName: hasOverride ? oldOverrideName : (hasOverrideRoute ? overrideRouteName : localizedName),
          pops: i,
        );

        breadCrumbItems.add(newBreadCrumb);
        path = '';
      }
    }
    emit(state.copyWith(breadCrumbs: breadCrumbItems));
  }

  void refreshCrumbs() {
    emit(state.copyWith(
      breadCrumbs: const [],
      previousBreadCrumbs: state.breadCrumbs,
    ));
  }

  void deleteCrumb() {
    final crumbs = state.breadCrumbs;
    crumbs.removeLast();
    emit(state.copyWith(breadCrumbs: crumbs));
  }

  (String?, String?) _initOverrideRoute(Object? arguments) {
    if (arguments != null &&
        arguments is Map<String, dynamic> &&
        arguments.containsKey('bread_crumb_name') &&
        arguments.containsKey('bread_crumb_override_route')) {
      return (arguments['bread_crumb_name'], arguments['bread_crumb_override_route']);
    }
    return (null, null);
  }

  (String?, String?) _receiveOldOverrideName(int index) {
    if (state.previousBreadCrumbs.isEmpty == true ||
        state.previousBreadCrumbs.length < index + 1) return (null, null);
    final bread = state.previousBreadCrumbs.elementAt(index);
    return (bread.localizedName, bread.name);
  }
}

