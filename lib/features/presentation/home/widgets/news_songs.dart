import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';
import 'package:spotify_bloc/lib_src.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 28.w),
      height: 200.h,
      child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
        builder: (context, state) {
          if (state is NewsSongsError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is NewsSongsLoaded) {
            return _songs(context, state.songs);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView _songs(BuildContext context, List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Uri(path: Routes.songPlayer, queryParameters: songs[index].toJson()).toString());
          },
          child: SizedBox(
            width: 147.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 11.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      image: DecorationImage(
                        image: NetworkImage(songs[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        transform: Matrix4.translationValues(10.w, 10.h, 0),
                        decoration: BoxDecoration(color: context.isDarkMode ? grey2 : grey5, shape: BoxShape.circle),
                        child: Align(
                          child: SvgPicture.asset(
                            Assets.icons.playIcon,
                            // ignore: deprecated_member_use
                            color: context.isDarkMode ? grey4 : grey1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        songs[index].artist,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 14.w,
        );
      },
    );
  }
}
