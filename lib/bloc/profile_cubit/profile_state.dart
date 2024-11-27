part of "profile_cubit.dart";

abstract interface class IProfileState extends Equatable {
  const IProfileState();
}

class ProfileInitialState extends IProfileState {

  const ProfileInitialState();
  
  @override
  List<Object?> get props => [];

}

class ProfileLoadingState extends IProfileState {

  const ProfileLoadingState();

  @override
  List<Object?> get props => [];

}

class ProfileLoadedState extends IProfileState {

  final ProfileModel profile;

  const ProfileLoadedState({required this.profile});

  @override
  List<Object?> get props => [profile];

}

class ProfileErrorState extends IProfileState {

  final ErrorMessage error;

  const ProfileErrorState({required this.error});

  @override
  List<Object?> get props => [error];
  
}

