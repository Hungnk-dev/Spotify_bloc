import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_bloc/common/bloc/favorite_button/favorite_butotn_state.dart';
import 'package:spotify_bloc/features/domain/usecase/song/add_or_remove_favorite_song.dart';
import 'package:spotify_bloc/lib_src.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdate(String songId) async {
    var result = await getIt<AddOrRemoveFavoriteSongUsecase>().call(params: songId);

    result.fold((l) {}, (isFavorite) {
      emit(FavoriteButtonUpdate(isFavorite: isFavorite));
    });
  }
}
