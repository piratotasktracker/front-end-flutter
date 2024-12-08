// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      name: json['name'] as String,
      createdById: json['createdById'] as String,
      projectId: json['projectId'] as String,
      assigneeId: json['assigneeId'] as String,
      assignee: json['assignee'] == null
          ? null
          : UserModel.fromJson(json['assignee'] as Map<String, dynamic>),
      createdBy: json['createdBy'] == null
          ? null
          : UserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      id: json['id'] as String,
      linkedTasks: (json['linkedTasks'] as List<dynamic>)
          .map((e) => ChildTaskResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'name': instance.name,
      'projectId': instance.projectId,
      'createdById': instance.createdById,
      'assigneeId': instance.assigneeId,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'linkedTasks': instance.linkedTasks,
      'assignee': instance.assignee,
      'createdBy': instance.createdBy,
    };

ChildTaskResponse _$ChildTaskResponseFromJson(Map<String, dynamic> json) =>
    ChildTaskResponse(
      name: json['name'] as String,
      id: json['id'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
      createdById: json['createdById'] as String,
      assigneeId: json['assigneeId'] as String,
      updatedAt: json['updatedAt'] as String,
      projectId: json['projectId'] as String,
    );

Map<String, dynamic> _$ChildTaskResponseToJson(ChildTaskResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'projectId': instance.projectId,
      'createdById': instance.createdById,
      'assigneeId': instance.assigneeId,
      'description': instance.description,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
