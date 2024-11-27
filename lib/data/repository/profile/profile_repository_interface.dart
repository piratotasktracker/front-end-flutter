import 'package:front_end_flutter_tracker/data/rest_client.dart';
import 'package:front_end_flutter_tracker/model/profile_model.dart';
import 'package:front_end_flutter_tracker/model/result_model.dart';

abstract class IProfileRepository {
  Future<(ProfileModel?, ErrorMessage?)> getProfile();

  final ApiClient apiClient;

  const IProfileRepository({required this.apiClient});
}