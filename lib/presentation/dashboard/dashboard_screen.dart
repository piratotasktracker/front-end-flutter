import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:front_end_flutter_tracker/bloc/my_tasks/my_tasks_cubit.dart';
import 'package:front_end_flutter_tracker/bloc/projects/projects_cubit.dart';
import 'package:front_end_flutter_tracker/data/repository/dashboard/dashboard_repository_interface.dart';
import 'package:front_end_flutter_tracker/presentation/dashboard/widgets/my_tasks/my_tasks_widget.dart';
import 'package:front_end_flutter_tracker/presentation/dashboard/widgets/projects/projects_widget.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/styles/typography.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProjectsCubit(
          repository: DependencyInjectionManager.sl<IDashboardRepository>()
        )),
        BlocProvider(create: (context) => MyTasksCubit(
          repository: DependencyInjectionManager.sl<IDashboardRepository>()
        )),
      ],
      child: CustomScrollView(
  slivers: [
    SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              AppLocalizations.of(context)!.projects,
              style: AppTypography.titleLarge(),
            ),
          ),
          const ProjectsWidget(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              AppLocalizations.of(context)!.my_tasks,
              style: AppTypography.titleLarge(),
            ),
          ),
          const MyTasksWidget(),
        ],
      ),
    ),
  ],
),
    );
  }

}