import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:front_end_flutter_tracker/styles/colors.dart';
import 'package:front_end_flutter_tracker/styles/typography.dart';
import 'package:front_end_flutter_tracker/bloc/profile_cubit/profile_cubit.dart';
import 'package:front_end_flutter_tracker/router.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/util/shared_preferences_manager.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 32),
      child: BlocBuilder<ProfileCubit, IProfileState>(
        bloc: context.read<ProfileCubit>(),
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            return _ExtendedPopupMenuButton(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              offset: const Offset(0, 30),
              onSelected: (value) {},
              itemBuilder: (context) => [
                PopupMenuItem(
                  enabled: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: SizedBox(
                            height: 32,
                            child: Center(child: 
                              Text(
                                AppLocalizations.of(context)!.profile,
                                style: AppTypography.bodyMedium(
                                  color: DependencyInjectionManager.sl<IAppColorScheme>().mono001
                                ),
                              )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          onTap: (){
                            Navigator.of(context).pop();
                            showLogoutDialog(context);
                          },
                          child: SizedBox(
                            height: 32,
                            child: Center(child: 
                              Text(
                                AppLocalizations.of(context)!.log_out,
                                style: AppTypography.bodyMedium(
                                  color: DependencyInjectionManager.sl<IAppColorScheme>().mono001
                                ),
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: DependencyInjectionManager.sl<IAppColorScheme>().mono0014,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      state.profile.fullName,
                      style: AppTypography.bodyMedium(),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      'assets/svg/caret-down-fill.svg', 
                      height: 16, 
                      width: 16,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProfileLoadingState) {
            return const CircularProgressIndicator();
          } else {
            return SizedBox.square(
              dimension: 32,
              child: SvgPicture.asset('assets/svg/user-gear-fill.svg'),
            );
          }
        },
      ),
    );
  }

  void showLogoutDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.log_out),
        content: Text(AppLocalizations.of(context)!.sure_log_out),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () {
              DependencyInjectionManager.sl<SharedPreferencesManager>().removeToken();
              context.goNamed(AppRoutes.login);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context)!.logged_out)),
              );
            },
            child: Text(AppLocalizations.of(context)!.log_out),
          ),
        ],
      ),
    );
  }
}

class _ExtendedPopupMenuButton extends StatefulWidget {
  final BorderRadius? borderRadius;
  final PopupMenuItemBuilder itemBuilder;
  final Widget? child;
  final Offset? offset;
  final ShapeBorder? shape;
  final Color? color;
  final double? elevation;
  final ValueChanged<int>? onSelected;

  const _ExtendedPopupMenuButton({
    required this.itemBuilder,
    this.borderRadius,
    this.child,
    this.offset,
    this.shape,
    this.color,
    this.elevation,
    this.onSelected,
  });

  @override
  _ExtendedPopupMenuButtonState createState() => _ExtendedPopupMenuButtonState();
}

class _ExtendedPopupMenuButtonState extends State<_ExtendedPopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      key: widget.key,
      message: MaterialLocalizations.of(context).showMenuTooltip,
      child: InkWell(
        onTap: () => _showButtonMenu(context),
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        child: widget.child,
      ),
    );
  }

  void _showButtonMenu(BuildContext context) {
    final PopupMenuThemeData popupMenuTheme = PopupMenuTheme.of(context);
    final RenderBox button = context.findRenderObject()! as RenderBox;
    final RenderBox overlay = Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
    late Offset offset;

    offset = widget.offset ?? Offset(0.0, button.size.height);

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(offset, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero) + offset, ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    final List<PopupMenuEntry> items = widget.itemBuilder(context);

    if (items.isNotEmpty) {
      showMenu(
        context: context,
        elevation: widget.elevation ?? popupMenuTheme.elevation,
        shadowColor: popupMenuTheme.shadowColor,
        surfaceTintColor: widget.color ?? popupMenuTheme.surfaceTintColor,
        color: widget.color ?? popupMenuTheme.surfaceTintColor,
        items: items,
        position: position,
        shape: widget.shape ?? popupMenuTheme.shape,
      );
    }
  }
}
