import 'package:flutter/foundation.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:front_end_flutter_tracker/bloc/bread_crumbs/bread_crumbs_cubit.dart';
import 'package:front_end_flutter_tracker/bloc/login/login_cubit.dart';
import 'package:front_end_flutter_tracker/bloc/profile_cubit/profile_cubit.dart';
import 'package:front_end_flutter_tracker/data/repository/auth/auth_repository.dart';
import 'package:front_end_flutter_tracker/data/repository/auth/auth_repository_interface.dart';
import 'package:front_end_flutter_tracker/data/repository/profile/profile_repository.dart';
import 'package:front_end_flutter_tracker/data/repository/profile/profile_repository_interface.dart';
import 'package:front_end_flutter_tracker/data/rest_client.dart';
import 'package:front_end_flutter_tracker/styles/colors.dart';
import 'package:front_end_flutter_tracker/util/shared_preferences_manager.dart';

class DependencyInjectionManager {

  static final GetIt sl = GetIt.instance;

  static Future<void> initDependencies(Brightness brightness) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    sl.registerSingleton<SharedPreferencesManager>(
      SharedPreferencesManager(prefs: prefs),
    );

    sl.registerSingleton<IAppColorScheme>(
      brightness == Brightness.light ? LightAppColorsScheme() : DarkAppColorsScheme()
    );

    sl.registerSingleton<ApiClient>(
      RestClient.createClient(),
    );

    sl.registerLazySingleton<BreadCrumbsCubit>(
      () => BreadCrumbsCubit()
    );

    sl.registerLazySingleton<IProfileRepository>(
      () => ProfileRepository(apiClient: sl<ApiClient>()),
    );

    sl.registerLazySingleton<ProfileCubit>(
      () => ProfileCubit(
        repository: sl<IProfileRepository>()
      )
    );

    sl.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(apiClient: sl<ApiClient>()),
    );

    sl.registerFactory<LoginCubit>(
      () => LoginCubit(
        repository: sl<IAuthRepository>(), 
        prefs: sl<SharedPreferencesManager>(),
      )
    );
    
  }
}