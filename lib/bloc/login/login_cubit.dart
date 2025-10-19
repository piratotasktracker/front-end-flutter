import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:front_end_flutter_tracker/data/repository/app_repository.dart';

import 'package:front_end_flutter_tracker/data/repository/auth/auth_repository_interface.dart';
import 'package:front_end_flutter_tracker/model/result_model.dart';
import 'package:front_end_flutter_tracker/util/shared_preferences_manager.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<ILoginState>{

  final IAuthRepository repository;
  final AppRepository appRepository;
  final SharedPreferencesManager prefs;

  LoginCubit({
    required this.repository, 
    required this.prefs,
    required this.appRepository
  }) : super(const LoginInitialState());

  void login({
    required String email,
    required String password,
  }) async {
    emit(const LoginLoadingState());
    final result = await repository.login(email: email, password: password);
    if(result.$1!=null){
      prefs.setToken(result.$1!.token);
      final roles = await repository.getRoles();
      if(roles.$1!=null){
        appRepository.setRoles(roles.$1!);
      }
      emit(const LoginSuccessState());
    }else if(result.$2!=null){
      emit(LoginErrorState(error: result.$2!));
    }
  }
  
}