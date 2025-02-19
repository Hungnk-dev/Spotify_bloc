import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_bloc/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';
import 'package:spotify_bloc/features/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spotify_bloc/features/presentation/song_player/bloc/song_player_state.dart';
import 'package:spotify_bloc/lib_src.dart';

class SongPlayerScreen extends StatelessWidget {
  const SongPlayerScreen({super.key, required this.song});

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          'Now Playing',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        action: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded, color: context.isDarkMode ? white : black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: BlocProvider<SongPlayerCubit>(
              create: (_) => SongPlayerCubit()..loadSong(song.urlSong),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  _buildSongImage(),
                  _buildSongDetail(context),
                  _buildPlayerSong(),
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildSongImage() {
    return Container(
      height: 370.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        image: DecorationImage(
          image: NetworkImage(song.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Padding _buildSongDetail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                song.title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                song.artist,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          FavoriteButton(song: song, size: 35.r),
        ],
      ),
    );
  }

  Widget _buildPlayerSong() {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(builder: (context, state) {
      if (state is SongPlayerError) {
        return Center(
          child: Text(state.message),
        );
      }
      if (state is SongPlayerLoaded) {
        return Column(
          children: [
            Slider(
              activeColor: context.isDarkMode ? grey5 : black1,
              onChanged: (value) {
                context.read<SongPlayerCubit>().audioPlayer.seek(Duration(seconds: value.toInt()));
              },
              min: 0.0,
              max: context.read<SongPlayerCubit>().songDuration.inSeconds.toDouble(),
              value: context.read<SongPlayerCubit>().songPosition.inSeconds.toDouble(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(context.read<SongPlayerCubit>().songPosition),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: context.isDarkMode ? grey5 : black1,
                  ),
                ),
                Text(
                  _formatDuration(context.read<SongPlayerCubit>().songDuration),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: context.isDarkMode ? grey5 : black1,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<SongPlayerCubit>().fastRewindSong();
                  },
                  icon: Icon(Icons.skip_previous_rounded, size: 40.r, color: context.isDarkMode ? grey5 : black1),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<SongPlayerCubit>().playOrPauseSong();
                  },
                  child: Container(
                      width: 45.w,
                      height: 45.w,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Icon(context.read<SongPlayerCubit>().audioPlayer.playing ? Icons.pause_rounded : Icons.play_arrow_rounded, size: 30.r, color: context.isDarkMode ? grey5 : black1)),
                ),
                IconButton(
                  onPressed: () {
                    context.read<SongPlayerCubit>().fastForwardSong();
                  },
                  icon: Icon(Icons.skip_next_rounded, size: 40.r, color: context.isDarkMode ? grey5 : black1),
                ),
              ],
            ),
          ],
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
