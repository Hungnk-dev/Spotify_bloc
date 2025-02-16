import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/features/data/models/auth/signin_user_req.dart';
import 'package:spotify_bloc/features/domain/repository/auth/auth_repo.dart';
import 'package:spotify_bloc/lib_src.dart';

class SigninUsecase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) {
    return getIt<AuthRepository>().signIn(params!);
  }
}
