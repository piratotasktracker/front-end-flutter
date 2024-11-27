import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:front_end_flutter_tracker/router.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/styles/colors.dart';
import 'package:front_end_flutter_tracker/styles/theme.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //TODO: doublecheck on dark mode colors
  await DependencyInjectionManager.initDependencies(Brightness.light);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //final brightness = PlatformDispatcher.instance.platformBrightness;
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.theme(
        DependencyInjectionManager.sl<IAppColorScheme>()
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
