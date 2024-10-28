import 'package:front_end_flutter_tracker/data/rest_client.dart';
import 'package:front_end_flutter_tracker/model/result_model.dart';
import 'package:front_end_flutter_tracker/model/token_model.dart';

abstract class IAuthRepository {
  Future<(TokenModel?, ErrorMessage?)> login({
    required String email,
    required String password, 
  });

  final ApiClient apiClient;

  const IAuthRepository({required this.apiClient});
}