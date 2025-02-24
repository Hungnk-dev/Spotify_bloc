import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_bloc/features/domain/usecase/song/add_or_remove_favorite_song.dart';
import 'package:spotify_bloc/features/service_locator.dart';

class FavoriteButtonCubit extends Cubit<Set<String>> {
  FavoriteButtonCubit() : super(<String>{});

  Future<void> favoriteButtonUpdate(String songId) async {
    final Either<dynamic, dynamic> result = await getIt<AddOrRemoveFavoriteSongUsecase>().call(params: songId);

    result.fold(
      (_) {},
      (isFavorite) {
        if (isFavorite == true) {
          state.add(songId);
        } else {
          state.remove(songId);
        }
        emit(state);
      },
    );
  }
}
