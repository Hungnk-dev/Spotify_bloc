import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_bloc/features/presentation/home/widgets/news_songs.dart';
import 'package:spotify_bloc/features/presentation/home/widgets/play_list.dart';
import 'package:spotify_bloc/lib_src.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBackButton: true,
        title: SvgPicture.asset(
          Assets.icons.logo,
          height: 40.h,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildArtistCard(),
            _buildTabBar(),
            SizedBox(
              height: 260.h,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const NewsSongs(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
            const PlayList()
          ],
        ),
      ),
    );
  }

  Widget _buildArtistCard() {
    return Center(
      child: SizedBox(
        height: 140.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                child: SvgPicture.asset(
                  Assets.icons.homeTopCard,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.only(right: 40.w),
                child: Image.asset(
                  Assets.images.homeArtist.path,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
      labelColor: context.isDarkMode ? white : black,
      labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
      indicatorPadding: EdgeInsets.symmetric(horizontal: 20.w),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      indicatorColor: primaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 2,
      unselectedLabelColor: context.isDarkMode ? white.withOpacity(0.5) : black.withOpacity(0.5),
      dividerHeight: 0,
      tabs: [
        Text(
          'News',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Videos',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Artists',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Podcasts',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
