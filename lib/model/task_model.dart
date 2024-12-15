import 'package:front_end_flutter_tracker/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

abstract class ITaskModel{
  
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "projectId")
  final String projectId;
  @JsonKey(name: "createdById")
  final String createdById;
  @JsonKey(name: "assigneeId")
  final String assigneeId;
  @JsonKey(name: "description")
  final String description;

  const ITaskModel({
    required this.name,
    required this.createdById,
    required this.projectId,
    required this.assigneeId,
    this.description = '',
  });

}

@JsonSerializable()
class TaskModel extends ITaskModel {
  final String id;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final List<ChildTaskResponse> linkedTasks;
  final UserModel? assignee;
  final UserModel? createdBy;

  TaskModel({
    required super.name, 
    required super.createdById, 
    required super.projectId, 
    required super.assigneeId,
    this.assignee,
    this.createdBy,
    required this.createdAt,
    required this.id,
    required this.linkedTasks,
    required this.updatedAt
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

}

@JsonSerializable()
class ChildTaskResponse extends ITaskModel{
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const ChildTaskResponse({
    required super.name,
    required this.id,
    required super.description,
    required this.createdAt,
    required super.createdById,
    required super.assigneeId,
    required this.updatedAt,
    required super.projectId,
  });

  factory ChildTaskResponse.fromJson(Map<String, dynamic> json) => _$ChildTaskResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChildTaskResponseToJson(this);

}