import 'package:json_annotation/json_annotation.dart';

import 'package:front_end_flutter_tracker/model/user_model.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {

  final String id;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;
  final List<UserModel> teamMembers;

  const ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.teamMembers,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);

}