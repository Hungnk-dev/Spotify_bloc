import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_bloc/features/domain/usecase/auth/get_user_usecase.dart';
import 'package:spotify_bloc/lib_src.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    getProfile();
  }
  Future<void> getProfile() async {
    final returnedUser = await getIt<GetUserUsecase>().call();
    returnedUser.fold((l) {
      emit(ProfileError(l.toString()));
    }, (data) {
      emit(ProfileLoaded(user: data));
    });
  }
}
