import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:front_end_flutter_tracker/presentation/home/widgets/bread_crumbs_widget.dart';
import 'package:front_end_flutter_tracker/presentation/home/widgets/create_new_task_widget.dart';
import 'package:front_end_flutter_tracker/presentation/home/widgets/profile_widget.dart';
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
        const CreateNewTaskWidget(),
        const SizedBox(width: 32),
        SizedBox.square(
          dimension: 32,
          child: IconButton(
            onPressed: (){}, 
            icon: SvgPicture.asset('assets/svg/square-half-fill.svg'),
          ),
        ),
        SizedBox.square(
          dimension: 32,
          child: IconButton(
            onPressed: (){}, 
            icon: SvgPicture.asset('assets/svg/magnifying-glass-fill.svg'),
          ),
        ),
        SizedBox.square(
          dimension: 32,
          child: IconButton(
            onPressed: (){}, 
            icon: SvgPicture.asset('assets/svg/bell-ringing-fill.svg'),
          ),
        ),
        const ProfileWidget()
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);

}