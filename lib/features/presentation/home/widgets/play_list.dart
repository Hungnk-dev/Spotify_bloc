import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_bloc/features/presentation/home/bloc/play_list_cubit.dart';
import 'package:spotify_bloc/features/presentation/home/bloc/play_list_state.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<PlayListCubit, PlayListState>(
          builder: (context, state) {
            if (state is PlayListError) {
              return Center(
                child: Text(state.message),
              );
            }
            // if (state is PlayListLoaded) {
            //   return _songs(context, state.songs);
            // }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }
}
