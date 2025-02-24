import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';
import 'package:spotify_bloc/lib_src.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.song, this.size, this.onTap});

  final SongEntity song;
  final double? size;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteButtonCubit, Set<String>>(
      buildWhen: (previous, current) {
        final bool isPreviousFavorite = previous.contains(song.songId);
        final bool isCurentFavorite = current.contains(song.songId);
        return isPreviousFavorite != isCurentFavorite;
      },
      builder: (context, state) {
        final bool isFavorited = state.contains(song.songId);
        return IconButton(
          onPressed: () {
            context.read<FavoriteButtonCubit>().favoriteButtonUpdate(song.songId);
          },
          icon: Icon(
            isFavorited ? Icons.favorite : Icons.favorite_outline_outlined,
            size: size ?? 25.r,
            color: context.isDarkMode ? grey2 : grey4,
          ),
        );
      },
    );
  }
}

class Hung extends StatefulWidget {
  const Hung({super.key});

  @override
  State<Hung> createState() => _HungState();
}

class _HungState extends State<Hung> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
