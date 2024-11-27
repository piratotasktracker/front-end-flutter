import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:front_end_flutter_tracker/data/repository/profile/profile_repository_interface.dart';
import 'package:front_end_flutter_tracker/model/profile_model.dart';
import 'package:front_end_flutter_tracker/model/result_model.dart';

class ProfileRepository extends IProfileRepository {

  const ProfileRepository({required super.apiClient});
  
  @override
  Future<(ProfileModel?, ErrorMessage?)> getProfile() async{
    try{
      return (await apiClient.getProfile(), null);
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