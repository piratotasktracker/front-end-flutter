part of "my_tasks_cubit.dart";


abstract interface class IMyTasksState extends Equatable {
  const IMyTasksState();
}

class MyTasksInitialState extends IMyTasksState {

  const MyTasksInitialState();
  
  @override
  List<Object?> get props => [];

}

class MyTasksLoadingState extends IMyTasksState {

  const MyTasksLoadingState();

  @override
  List<Object?> get props => [];

}

class MyTasksLoadedState extends IMyTasksState {

  final List<TaskModel> myTasks;

  const MyTasksLoadedState({required this.myTasks});

  @override
  List<Object?> get props => [myTasks];

}

class MyTasksErrorState extends IMyTasksState {

  final ErrorMessage error;

  const MyTasksErrorState({required this.error});

  @override
  List<Object?> get props => [error];
  
}

