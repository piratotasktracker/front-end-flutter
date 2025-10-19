import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String? avatar;
  final String email;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String roleId;

  const UserModel({
    required this.id,
    required this.avatar,
    required this.email,
    required this.fullName,
    required this.roleId
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}