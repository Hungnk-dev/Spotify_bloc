import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/features/data/models/auth/create_user_req.dart';
import 'package:spotify_bloc/features/domain/repository/auth/auth_repo.dart';
import 'package:spotify_bloc/lib_src.dart';

class SignupUsecase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return getIt<AuthRepository>().signUp(params!);
  }
}
