import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:front_end_flutter_tracker/bloc/projects/projects_cubit.dart';
import 'package:front_end_flutter_tracker/presentation/dashboard/widgets/projects/project_card.dart';
import 'package:front_end_flutter_tracker/presentation/reusable_widgets.dart/error_widget.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, IProjectsState>(
      bloc: context.read<ProjectsCubit>()..getProjects(),
      builder: (context, state) {
        if(state is ProjectsLoadedState){
          return SizedBox(
            height: state.projects.isNotEmpty ? 168 : 0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.projects.length,
              itemBuilder: (context, i) {
                return ProjectCard(
                  project: state.projects[i], 
                  isFirst: i == 0,
                  isLast: i == state.projects.length,
                );
              }
            ),
          );
        } else if(state is ProjectsLoadingState){
          return const SizedBox(
            height: 168,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if(state is ProjectsErrorState){
          return const ErrorTextWidget();
        } else {
          return const SizedBox(
            height: 168,
          );
        }
      }
    );
  }

}