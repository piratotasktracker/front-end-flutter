import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:front_end_flutter_tracker/data/repository/profile/profile_repository_interface.dart';
import 'package:front_end_flutter_tracker/model/profile_model.dart';
import 'package:front_end_flutter_tracker/model/result_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<IProfileState>{

  final IProfileRepository repository;

  ProfileCubit({
    required this.repository,
  }) : super(const ProfileInitialState());

  void getProfile() async {
    final result = await repository.getProfile();
    if(result.$1!=null){
      emit(ProfileLoadedState(
        profile: result.$1!
      ));
    }else if(result.$2!=null){
      emit(ProfileErrorState(error: result.$2!));
    }
  }
  
}