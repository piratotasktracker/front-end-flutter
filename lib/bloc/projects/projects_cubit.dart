import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:front_end_flutter_tracker/data/repository/dashboard/dashboard_repository_interface.dart';
import 'package:front_end_flutter_tracker/model/project_model.dart';
import 'package:front_end_flutter_tracker/model/result_model.dart';

part 'projects_state.dart';

class ProjectsCubit extends Cubit<IProjectsState>{

  final IDashboardRepository repository;

  ProjectsCubit({
    required this.repository,
  }) : super(const ProjectsInitialState());

  void getProjects() async {
    emit(const ProjectsLoadingState());
    final result = await repository.getProjects();
    if(result.$1!=null){
      emit(ProjectsLoadedState(
        projects: result.$1!
      ));
    }else if(result.$2!=null){
      emit(ProjectsErrorState(error: result.$2!));
    }
  }
  
}