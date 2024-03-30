part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final StudentProfileModel studentProfileModel;

  ProfileLoaded(this.studentProfileModel);

  @override
  List<Object> get props => [studentProfileModel];
}

class ProfileError extends ProfileState {
  final String errorMessage;

  ProfileError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
