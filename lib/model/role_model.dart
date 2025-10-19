import 'package:json_annotation/json_annotation.dart';

part 'role_model.g.dart';

abstract class IRoleModel {
  final String name;
  
  // General parameter
  final bool isAdmin;

  // Projects permissions
  final bool canCreateProjects;
  final bool canUpdateProjects;
  final bool canDeleteProjects;
  final bool canGetProjects;
  
  // Tasks permissions
  final bool canCreateTasks;
  final bool canUpdateTasks;
  final bool canDeleteTasks;
  final bool canGetTasks;
  
  // Users permissions
  final bool canUpdateUsers;
  final bool canDeleteUsers;
  final bool canGetUsers;
  
  // Roles permissions
  final bool canCreateRoles;
  final bool canUpdateRoles;
  final bool canDeleteRoles;
  final bool canGetRoles;

  const IRoleModel({
    required this.name,
    required this.isAdmin,
    required this.canCreateProjects,
    required this.canUpdateProjects,
    required this.canDeleteProjects,
    required this.canGetProjects,
    required this.canCreateTasks,
    required this.canUpdateTasks,
    required this.canDeleteTasks,
    required this.canGetTasks,
    required this.canUpdateUsers,
    required this.canDeleteUsers,
    required this.canGetUsers,
    required this.canCreateRoles,
    required this.canUpdateRoles,
    required this.canDeleteRoles,
    required this.canGetRoles,
  });
} 

@JsonSerializable()
class RoleModel extends IRoleModel {
  final String id;

  const RoleModel({
    required this.id,
    required super.name,
    required super.isAdmin,
    required super.canCreateProjects,
    required super.canCreateRoles,
    required super.canCreateTasks,
    required super.canDeleteProjects,
    required super.canDeleteRoles,
    required super.canDeleteTasks,
    required super.canDeleteUsers,
    required super.canGetProjects,
    required super.canGetRoles,
    required super.canGetTasks,
    required super.canGetUsers,
    required super.canUpdateProjects,
    required super.canUpdateRoles,
    required super.canUpdateTasks,
    required super.canUpdateUsers,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);

}