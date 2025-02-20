import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_bloc/common/bloc/favorite_button/favorite_butotn_state.dart';
import 'package:spotify_bloc/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';
import 'package:spotify_bloc/lib_src.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.song, this.size, this.onTap});

  final SongEntity song;
  final double? size;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(buildWhen: (previous, current) {
      if (previous is FavoriteButtonUpdate && current is FavoriteButtonUpdate) {
        return previous.isFavorite != current.isFavorite;
      }
      return true;
    }, builder: (context, state) {
      if (state is FavoriteButtonInitial) {
        return IconButton(
          onPressed: () async {
            await context.read<FavoriteButtonCubit>().favoriteButtonUpdate(song.songId);
            if (onTap != null) {
              onTap!();
            }
          },
          icon: Icon(
            song.isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
            size: size ?? 25.r,
            color: context.isDarkMode ? grey2 : grey4,
          ),
        );
      }

      if (state is FavoriteButtonUpdate) {
        return IconButton(
          onPressed: () {
            context.read<FavoriteButtonCubit>().favoriteButtonUpdate(song.songId);
          },
          icon: Icon(
            state.isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
            size: size ?? 25.r,
            color: context.isDarkMode ? grey2 : grey4,
          ),
        );
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
