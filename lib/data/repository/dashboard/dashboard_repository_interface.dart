import 'package:front_end_flutter_tracker/data/rest_client.dart';
import 'package:front_end_flutter_tracker/model/project_model.dart';
import 'package:front_end_flutter_tracker/model/result_model.dart';
import 'package:front_end_flutter_tracker/model/task_model.dart';

abstract class IDashboardRepository {
  Future<(List<ProjectModel>?, ErrorMessage?)> getProjects();
  
  Future<(List<TaskModel>?, ErrorMessage?)> getMyTasks();

  final ApiClient apiClient;

  const IDashboardRepository({required this.apiClient});
}