import 'package:spotify_bloc/features/domain/entites/auth/user.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserEntity user;

  ProfileLoaded({required this.user});
}

class ProfileError extends ProfileState {
  final String? message;

  ProfileError(this.message);
}
