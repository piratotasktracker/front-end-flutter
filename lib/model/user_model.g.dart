// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      avatar: json['avatar'] as String?,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      roleId: json['roleId'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'email': instance.email,
      'full_name': instance.fullName,
      'roleId': instance.roleId,
    };
