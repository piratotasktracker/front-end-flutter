// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      id: json['id'] as String,
      name: json['name'] as String,
      isAdmin: json['isAdmin'] as bool,
      canCreateProjects: json['canCreateProjects'] as bool,
      canCreateRoles: json['canCreateRoles'] as bool,
      canCreateTasks: json['canCreateTasks'] as bool,
      canDeleteProjects: json['canDeleteProjects'] as bool,
      canDeleteRoles: json['canDeleteRoles'] as bool,
      canDeleteTasks: json['canDeleteTasks'] as bool,
      canDeleteUsers: json['canDeleteUsers'] as bool,
      canGetProjects: json['canGetProjects'] as bool,
      canGetRoles: json['canGetRoles'] as bool,
      canGetTasks: json['canGetTasks'] as bool,
      canGetUsers: json['canGetUsers'] as bool,
      canUpdateProjects: json['canUpdateProjects'] as bool,
      canUpdateRoles: json['canUpdateRoles'] as bool,
      canUpdateTasks: json['canUpdateTasks'] as bool,
      canUpdateUsers: json['canUpdateUsers'] as bool,
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'name': instance.name,
      'isAdmin': instance.isAdmin,
      'canCreateProjects': instance.canCreateProjects,
      'canUpdateProjects': instance.canUpdateProjects,
      'canDeleteProjects': instance.canDeleteProjects,
      'canGetProjects': instance.canGetProjects,
      'canCreateTasks': instance.canCreateTasks,
      'canUpdateTasks': instance.canUpdateTasks,
      'canDeleteTasks': instance.canDeleteTasks,
      'canGetTasks': instance.canGetTasks,
      'canUpdateUsers': instance.canUpdateUsers,
      'canDeleteUsers': instance.canDeleteUsers,
      'canGetUsers': instance.canGetUsers,
      'canCreateRoles': instance.canCreateRoles,
      'canUpdateRoles': instance.canUpdateRoles,
      'canDeleteRoles': instance.canDeleteRoles,
      'canGetRoles': instance.canGetRoles,
      'id': instance.id,
    };
