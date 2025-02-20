import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/common/widgets/cached_network_image/cached_network_image.dart';
import 'package:spotify_bloc/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';
import 'package:spotify_bloc/features/presentation/profile/bloc/favorite_songs_cubit.dart';
import 'package:spotify_bloc/features/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:spotify_bloc/features/presentation/profile/bloc/profile_cubit.dart';
import 'package:spotify_bloc/features/presentation/profile/bloc/profile_state.dart';
import 'package:spotify_bloc/lib_src.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        backgroundColor: context.isDarkMode ? black2 : white,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        action: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_rounded,
            color: context.isDarkMode ? white : black,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildProfile(context),
          SizedBox(height: 20.h),
          Expanded(child: _buildFavoriteSongs()),
        ],
      ),
    );
  }

  Widget _buildFavoriteSongs() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Favorite Songs',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocProvider(
            create: (_) => FavoriteSongsCubit()..getFavoriteSongs(),
            child: BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
              builder: (context, state) {
                if (state is FavoriteSongsError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is FavoriteSongsLoaded) {
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    shrinkWrap: true,
                    itemCount: state.songs.length,
                    itemBuilder: (context, index) {
                      final song = state.songs[index];
                      return InkWell(
                          borderRadius: BorderRadius.circular(15.r),
                          onTap: () {
                            GoRouter.of(context).push(Uri(path: Routes.songPlayer, queryParameters: song.toJson()).toString());
                          },
                          child: _buildItemFavoriteSong(song, context, index));
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20.h);
                    },
                  );
                }

                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Row _buildItemFavoriteSong(SongEntity song, BuildContext context, int index) {
    return Row(
      children: [
        Container(
          height: 60.w,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                song.imageUrl,
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                song.title,
                style: TextStyle(
                  fontSize: 15.sp,
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
        ),
        Text(
          song.duration.replaceAll('.', ':'),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 10.w),
        FavoriteButton(
          song: song,
          key: UniqueKey(),
          onTap: () {
            context.read<FavoriteSongsCubit>().removeSong(index);
          },
        ),
      ],
    );
  }

  Widget _buildProfile(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..getProfile(),
      child: Container(
        height: 300.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.isDarkMode ? black2 : white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.r),
            bottomRight: Radius.circular(50.r),
          ),
        ),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileError) {
              return Center(
                child: Text(state.message ?? ''),
              );
            }

            if (state is ProfileLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomNetworkImage(
                    height: 90.w,
                    width: 90.w,
                    urlToImage: state.user.imageUrl,
                    shape: BoxShape.circle,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    state.user.email,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    state.user.fullName,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '778',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Followes',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '221',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Followes',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }

            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
