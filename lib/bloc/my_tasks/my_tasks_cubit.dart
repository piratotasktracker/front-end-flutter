import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:front_end_flutter_tracker/data/repository/dashboard/dashboard_repository_interface.dart';
import 'package:front_end_flutter_tracker/model/result_model.dart';
import 'package:front_end_flutter_tracker/model/task_model.dart';

part 'my_tasks_state.dart';

class MyTasksCubit extends Cubit<IMyTasksState>{

  final IDashboardRepository repository;

  MyTasksCubit({
    required this.repository,
  }) : super(const MyTasksInitialState());

  void getMyTasks() async {
    emit(const MyTasksLoadingState());
    final result = await repository.getMyTasks();
    if(result.$1!=null){
      emit(MyTasksLoadedState(
        myTasks: result.$1!
      ));
    }else if(result.$2!=null){
      emit(MyTasksErrorState(error: result.$2!));
    }
  }
  
}