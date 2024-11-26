import 'package:flutter/material.dart';
import 'package:front_end_flutter_tracker/presentation/home/widgets/bread_crumbs_widget.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/styles/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 52,
      titleSpacing: 0,
      title: const BreadCrumbsWidget(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: DependencyInjectionManager.sl<IAppColorScheme>().mono0010,
          height: 1,
        ),
      ),
      centerTitle: false,
      actions: [
        
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);

}