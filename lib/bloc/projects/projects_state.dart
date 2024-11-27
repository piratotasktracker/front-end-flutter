part of "projects_cubit.dart";

abstract interface class IProjectsState extends Equatable {
  const IProjectsState();
}

class ProjectsInitialState extends IProjectsState {

  const ProjectsInitialState();
  
  @override
  List<Object?> get props => [];

}

class ProjectsLoadingState extends IProjectsState {

  const ProjectsLoadingState();

  @override
  List<Object?> get props => [];

}

class ProjectsLoadedState extends IProjectsState {

  final List<ProjectModel> projects;

  const ProjectsLoadedState({required this.projects});

  @override
  List<Object?> get props => [projects];

}

class ProjectsErrorState extends IProjectsState {

  final ErrorMessage error;

  const ProjectsErrorState({required this.error});

  @override
  List<Object?> get props => [error];
  
}

