import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String? avatar;
  final String email;
  @JsonKey(name: 'full_name')
  final String fullName;
  final PermissionLevel role;

  const UserModel({
    required this.id,
    required this.avatar,
    required this.email,
    required this.fullName,
    required this.role
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}

enum PermissionLevel{
  @JsonValue(0)
  unknown(0),
  @JsonValue(1)
  executor(1),
  @JsonValue(2)
  manager(2),
  @JsonValue(3)
  administrator(3),
  @JsonValue(4)
  owner(4);

  const PermissionLevel(this.value);
  
  final int value;

  static PermissionLevel fromInt(int value) {
    switch (value){
      case 0: return PermissionLevel.unknown; 
      case 1: return PermissionLevel.executor;
      case 2: return PermissionLevel.manager;
      case 3: return PermissionLevel.administrator;
      case 4: return PermissionLevel.owner;
      default: return PermissionLevel.unknown;
    }
  }
}