import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_bloc/features/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify_bloc/features/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: BlocBuilder<NewsSongsCubit, NewsSongsState>(builder: (context, state) {
        if (state is NewsSongsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NewsSongsError) {
          return Center(
            child: Text(state.message),
          );
        }
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 200.w,
              height: 200.h,
              color: Colors.red,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
        );
      }),
    );
  }
}
