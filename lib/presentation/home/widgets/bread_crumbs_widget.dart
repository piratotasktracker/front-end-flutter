import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:go_router/go_router.dart';

import 'package:front_end_flutter_tracker/bloc/bread_crumbs/bread_crumbs_cubit.dart';
import 'package:front_end_flutter_tracker/bloc/bread_crumbs/bread_crumbs_state.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/styles/colors.dart';
import 'package:front_end_flutter_tracker/styles/typography.dart';

class BreadCrumbsWidget extends StatelessWidget {

  final String? dividerSymbol;
  final double? fixedLeftPadding;
  final bool previousBreadsColored;

  const BreadCrumbsWidget({
    super.key, 
    this.dividerSymbol,
    this.previousBreadsColored = false,
    this.fixedLeftPadding,
  });

  @override
  Widget build(BuildContext context) {

    void crumbNavigator(int timesToPop) {
      for (var i = 1; i < timesToPop; i++) {
        context.pop();
      }
    }

    return BlocBuilder<BreadCrumbsCubit, BreadCrumbsState>(
      bloc: context.read<BreadCrumbsCubit>(),
      builder: (context, state) {
        return state.breadCrumbs.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24, 
                  vertical: 16,
                ),
                child: BreadCrumb.builder(
                  divider: dividerSymbol != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            dividerSymbol!,
                            style: AppTypography.bodySmall(),
                          ),
                        )
                      : Image.asset(
                          'packages/portals/assets/png/bread_crumbs_divider.png',
                          height: 24,
                          width: 24,
                        ),
                  itemCount: state.breadCrumbs.length,
                  builder: (index) {
                    final isColored =
                        index != state.breadCrumbs.length - 1 && previousBreadsColored;
                    return BreadCrumbItem(
                      content: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => crumbNavigator(
                          state.breadCrumbs.length - index,
                        ),
                        hoverColor: Colors.transparent,
                        child: Text(
                          state.breadCrumbs[index].localizedName.toCapitalized(),
                          style: AppTypography.bodySmall(
                            color: isColored 
                              ? DependencyInjectionManager.sl<IAppColorScheme>().mono003 
                              : DependencyInjectionManager.sl<IAppColorScheme>().mono001,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : const SizedBox(height: 32);
      },
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}