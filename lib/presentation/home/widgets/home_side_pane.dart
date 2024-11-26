import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/styles/colors.dart';
import 'package:front_end_flutter_tracker/styles/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeSidePane extends StatelessWidget {
  final double width;

  const HomeSidePane({
    required this.width,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: key,
      width: width,
      child: Material(
        color: DependencyInjectionManager.sl<IAppColorScheme>().mono0014,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if(constraints.maxWidth >= 185){
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 64,
                            maxWidth: 300
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ListTile(
                              leading: SvgPicture.asset('assets/svg/skull-fill.svg'),
                              title: const Text(
                                'Pirato',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Onest',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SidePaneButton(
                          text: AppLocalizations.of(context)!.dashboard, 
                          icon: SvgPicture.asset('assets/svg/squares-four-fill.svg'),
                        ),
                        const SizedBox(height: 8),
                        SidePaneButton(
                          text: AppLocalizations.of(context)!.settings, 
                          icon: SvgPicture.asset('assets/svg/gear-fine-fill.svg'),
                        ),
                        const SizedBox(height: 8),
                        SidePaneButton(
                          text: AppLocalizations.of(context)!.cicd, 
                          icon: SvgPicture.asset('assets/svg/lego-fill.svg'),
                        ),
                        const SizedBox(height: 8),
                        SidePaneButton(
                          text: AppLocalizations.of(context)!.modules, 
                          icon: SvgPicture.asset('assets/svg/circles-three-fill.svg'),
                        ),
                        const SizedBox(height: 8),
                        SidePaneButton(
                          text: AppLocalizations.of(context)!.documentation, 
                          icon: SvgPicture.asset('assets/svg/list-bullets-fill.svg'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: DependencyInjectionManager.sl<IAppColorScheme>().mono0010,
                    width: 1,
                  ),
                ],
              );
            } else{
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: SvgPicture.asset('assets/svg/skull-fill.svg'),
                        ),
                        const SizedBox(height: 16),
                        SidePaneIconButton(
                          onPressed: (){}, 
                          icon: SvgPicture.asset('assets/svg/squares-four-fill.svg'),
                        ),
                        const SizedBox(height: 8),
                        SidePaneIconButton(
                          onPressed: (){}, 
                          icon: SvgPicture.asset('assets/svg/gear-fine-fill.svg'),
                        ),
                        const SizedBox(height: 8),
                        SidePaneIconButton(
                          onPressed: (){}, 
                          icon: SvgPicture.asset('assets/svg/lego-fill.svg'),
                        ),
                        const SizedBox(height: 8),
                        SidePaneIconButton(
                          onPressed: (){}, 
                          icon: SvgPicture.asset('assets/svg/circles-three-fill.svg'),
                        ),
                        const SizedBox(height: 8),
                        SidePaneIconButton(
                          onPressed: (){}, 
                          icon: SvgPicture.asset('assets/svg/list-bullets-fill.svg'),
                        ),
                      ]
                    ),
                  ),
                  Container(
                    color: DependencyInjectionManager.sl<IAppColorScheme>().mono0010,
                    width: 1,
                  ),
                ],
              );
            }
          }
        ),
      ),
    );
  }

}

class SidePaneIconButton extends StatelessWidget{
  final Widget icon;
  final Function? onPressed;

  const SidePaneIconButton({
    super.key,
    required this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: () => onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 17),
        child: icon,
      ),
    );
  }

}

class SidePaneButton extends StatelessWidget{

  final Widget icon;
  final String text;
  final Function? onPressed;

  const SidePaneButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        onTap: () => onPressed,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        leading: icon,
        title: Text(
          text,
          style: AppTypography.bodyMedium(),
        ),
      ),
    );
  }

}