import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {

  final String email;
  final String? avatar;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String id;

  const ProfileModel({
    required this.id,
    required this.fullName,
    this.avatar,
    required this.email
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

}