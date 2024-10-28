import 'package:flutter/foundation.dart';
import 'package:front_end_flutter_tracker/styles/colors.dart';
import 'package:get_it/get_it.dart';

class DependencyInjectionManager {

  static final GetIt sl = GetIt.instance;

  static Future<void> initDependencies(Brightness brightness) async {

    sl.registerSingleton<IAppColorScheme>(
      brightness == Brightness.light ? LightAppColorsScheme() : DarkAppColorsScheme()
    );

  }

}