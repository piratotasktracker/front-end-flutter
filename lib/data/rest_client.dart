import 'package:flutter/foundation.dart';
import 'package:front_end_flutter_tracker/model/project_model.dart';
import 'package:front_end_flutter_tracker/model/task_model.dart';

import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

import 'package:front_end_flutter_tracker/model/profile_model.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/util/constants.dart';
import 'package:front_end_flutter_tracker/model/token_model.dart';
import 'package:front_end_flutter_tracker/util/shared_preferences_manager.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) => _ApiClient(dio);

  @POST('/login')
  Future<TokenModel> login({
    @Field('email') required String email,
    @Field('password') required String password,
  });

  @GET('/me')
  Future<ProfileModel> getProfile();

  @GET('/projects')
  Future<List<ProjectModel>> getProjects();

  @GET('/tasks/me')
  Future<List<TaskModel>> getMyTasks();

}

class RestClient {

  const RestClient();

  static ApiClient createClient(){
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      )
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          if(options.path.contains('/posts')) {
            return false;
          }
          return !args.isResponse || !args.hasUint8ListData;
        }
      )
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = DependencyInjectionManager.sl<SharedPreferencesManager>().getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            //TODO: logout
          }
          return handler.next(error);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),
    );
    return ApiClient(dio);
  }
  
}