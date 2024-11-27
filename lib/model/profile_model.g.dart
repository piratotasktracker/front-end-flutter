// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      avatar: json['avatar'] as String?,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'avatar': instance.avatar,
      'full_name': instance.fullName,
      'id': instance.id,
    };
