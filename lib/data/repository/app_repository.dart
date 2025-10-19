import 'package:front_end_flutter_tracker/model/role_model.dart';
import 'package:front_end_flutter_tracker/util/permission_enum.dart';

class AppRepository {
  List<RoleModel>? roles;

  AppRepository({
    this.roles,
  });

  void setRoles(List<RoleModel> roles){
    this.roles = roles;
  }

  bool isHasPermission({required String roleId, required PermissionEnum permission}){
    final RoleModel? role = roles?.firstWhere((i)=>i.id == roleId);

    if (role == null) return false;

    if (role.isAdmin) return true;

    switch (permission) {
      case PermissionEnum.canCreateProjects:
        return role.canCreateProjects;
      case PermissionEnum.canUpdateProjects:
        return role.canUpdateProjects;
      case PermissionEnum.canDeleteProjects:
        return role.canDeleteProjects;
      case PermissionEnum.canGetProjects:
        return role.canGetProjects;

      case PermissionEnum.canCreateTasks:
        return role.canCreateTasks;
      case PermissionEnum.canUpdateTasks:
        return role.canUpdateTasks;
      case PermissionEnum.canDeleteTasks:
        return role.canDeleteTasks;
      case PermissionEnum.canGetTasks:
        return role.canGetTasks;

      case PermissionEnum.canUpdateUsers:
        return role.canUpdateUsers;
      case PermissionEnum.canDeleteUsers:
        return role.canDeleteUsers;
      case PermissionEnum.canGetUsers:
        return role.canGetUsers;

      case PermissionEnum.canCreateRoles:
        return role.canCreateRoles;
      case PermissionEnum.canUpdateRoles:
        return role.canUpdateRoles;
      case PermissionEnum.canDeleteRoles:
        return role.canDeleteRoles;
      case PermissionEnum.canGetRoles:
        return role.canGetRoles;
    }
  }
}