import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';
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
    );
  }
}
