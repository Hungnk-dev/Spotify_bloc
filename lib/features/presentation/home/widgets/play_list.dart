import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';
import 'package:spotify_bloc/lib_src.dart';

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
            if (state is PlayListLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            'Play List',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'See More',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _songs(context, state.songs),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }

  Widget _songs(BuildContext context, List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 20.w, right: 8.w),
      itemCount: songs.length,
      separatorBuilder: (context, index) => SizedBox(height: 15.h),
      itemBuilder: (context, index) {
        final song = songs[index];
        return InkWell(
          borderRadius: BorderRadius.circular(15.r),
          onTap: () {
            GoRouter.of(context).push(Uri(path: Routes.songPlayer, queryParameters: songs[index].toJson()).toString());
          },
          child: Row(
            children: [
              Container(
                height: 37.h,
                width: 37.w,
                decoration: BoxDecoration(color: context.isDarkMode ? grey2 : grey5, shape: BoxShape.circle),
                child: Align(
                  child: SvgPicture.asset(
                    Assets.icons.playIcon,
                    // ignore: deprecated_member_use
                    color: context.isDarkMode ? grey4 : grey1,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
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
              const Spacer(),
              Text(
                song.duration.replaceAll('.', ':'),
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 20.w),
              FavoriteButton(song: song),
            ],
          ),
        );
      },
    );
  }
}
