import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:front_end_flutter_tracker/model/result_model.dart';
import 'package:front_end_flutter_tracker/model/token_model.dart';

import 'auth_repository_interface.dart';

class AuthRepository extends IAuthRepository {

  const AuthRepository({required super.apiClient});

  @override
  Future<(TokenModel?, ErrorMessage?)> login({
    required String email,
    required String password, 
  }) async {
    try{
      return (await apiClient.login(email: email, password: password), null);
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