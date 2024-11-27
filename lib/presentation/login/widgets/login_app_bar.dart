import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_svg/svg.dart';

import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/styles/colors.dart';
import 'package:front_end_flutter_tracker/styles/typography.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 24, right: 4),
        child: SvgPicture.asset('assets/svg/skull-fill.svg'),
      ),
      leadingWidth: 52,
      titleSpacing: 0,
      title: const Text(
        'Pirato',
        style: TextStyle(
          height: 28,
          fontSize: 24,
          fontFamily: 'Onest',
          fontWeight: FontWeight.w700,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
            color: DependencyInjectionManager.sl<IAppColorScheme>().mono0010,
            height: 1,
        ),
      ),
      centerTitle: false,
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: AppTypography.labelMedium(color: DependencyInjectionManager.sl<IAppColorScheme>().mono0014)
          ),
          onPressed: (){}, 
          child: Text(
            AppLocalizations.of(context)!.about,
          )
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: AppTypography.labelMedium(color: DependencyInjectionManager.sl<IAppColorScheme>().mono0014)
          ),
          onPressed: (){}, 
          child: Text(
            AppLocalizations.of(context)!.downloads
          )
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: AppTypography.labelMedium(color: DependencyInjectionManager.sl<IAppColorScheme>().mono0014)
          ),
          onPressed: (){}, 
          child: Text(
            AppLocalizations.of(context)!.recources,
          )
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: AppTypography.labelMedium(color: DependencyInjectionManager.sl<IAppColorScheme>().mono0014)
          ),
          onPressed: (){}, 
          child: Text(
            AppLocalizations.of(context)!.why_pirato,
          )
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);

}