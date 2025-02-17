import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_bloc/features/domain/usecase/song/get_play_list.dart';
import 'package:spotify_bloc/lib_src.dart';

import 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading()) {
    getPlayList();
  }

  Future<void> getPlayList() async {
    var returnedSongs = await getIt<GetPlayListUsecase>().call();

    returnedSongs.fold((l) {
      emit(PlayListError(l.toString()));
    }, (data) {
      emit(PlayListLoaded(songs: data));
    });
  }
}
