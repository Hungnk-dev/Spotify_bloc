import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_bloc/features/domain/usecase/song/get_news_songs.dart';
import 'package:spotify_bloc/features/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_bloc/lib_src.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await getIt<GetNewsSongsUsecase>().call();

    returnedSongs.fold((l) {
      emit(NewsSongsError(l.toString()));
    }, (data) {
      emit(NewsSongsLoaded(songs: data));
    });
  }
}
