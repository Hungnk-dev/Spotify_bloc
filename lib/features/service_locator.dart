import 'package:get_it/get_it.dart';
import 'package:spotify_bloc/features/data/repository/auth_repository_impl.dart';
import 'package:spotify_bloc/features/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_bloc/features/domain/repository/auth/auth_repo.dart';
import 'package:spotify_bloc/features/domain/usecase/auth/signin_usecase.dart';
import 'package:spotify_bloc/features/domain/usecase/auth/signup_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUsecase>(SignupUsecase());

  sl.registerSingleton<SigninUsecase>(SigninUsecase());
}
