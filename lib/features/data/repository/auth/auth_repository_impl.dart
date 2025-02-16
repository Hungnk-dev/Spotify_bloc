import 'package:dartz/dartz.dart';
import 'package:spotify_bloc/features/data/models/auth/create_user_req.dart';
import 'package:spotify_bloc/features/data/models/auth/signin_user_req.dart';
import 'package:spotify_bloc/features/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_bloc/features/domain/repository/auth/auth_repo.dart';
import 'package:spotify_bloc/features/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    return await getIt<AuthFirebaseService>().signIn(signinUserReq);
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await getIt<AuthFirebaseService>().signUp(createUserReq);
  }
}
