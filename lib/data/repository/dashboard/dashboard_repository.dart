import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:front_end_flutter_tracker/data/repository/dashboard/dashboard_repository_interface.dart';
import 'package:front_end_flutter_tracker/model/project_model.dart';
import 'package:front_end_flutter_tracker/model/result_model.dart';

class DashboardRepository extends IDashboardRepository {

  const DashboardRepository({required super.apiClient});

  @override
  Future<(List<ProjectModel>?, ErrorMessage?)> getProjects() async {
    try{
      return (await apiClient.getProjects(), null);
    } catch (e){
      if (e is DioException) {
        return (null, ErrorMessage(
          result: e.response?.data is String ? jsonDecode((e.response?.data as String))['result'] ?? 'An error occurred' : 'An error occurred', 
          statusCode: e.response?.statusCode ?? 0
        ));
      } else {
        return (null, const ErrorMessage(
          result: 'An unexpected error occurred', 
          statusCode: 0
        ));
      }
    }
  }
  
}