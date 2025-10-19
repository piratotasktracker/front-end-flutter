import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end_flutter_tracker/bloc/profile_cubit/profile_cubit.dart';
import 'package:front_end_flutter_tracker/data/repository/app_repository.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/util/permission_enum.dart';

class CreateNewTaskWidget extends StatelessWidget {
  const CreateNewTaskWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 32),
      child: BlocBuilder<ProfileCubit, IProfileState>(
        bloc: context.read<ProfileCubit>(),
        builder: (context, state) {
          if (state is ProfileLoadedState) {
            if (DependencyInjectionManager.sl<AppRepository>().isHasPermission(roleId: state.profile.roleId, permission: PermissionEnum.canCreateProjects)){
              return SizedBox(
                height: 32,
                width: 200,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text(AppLocalizations.of(context)!.create_new_task)
                ),
              );
            }else{
              return const SizedBox(
                height: 32,
                width: 200,
              );
            }
          }else {
            return const SizedBox(
              height: 32,
              width: 200,
            );
          }
        },
      ),
    );
  }
}