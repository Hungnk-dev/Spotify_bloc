import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/features/domain/entites/songs/song_entity.dart';
import 'package:spotify_bloc/lib_src.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.rootRoute,
    routes: [
      transitionGoRoute(
        path: Routes.rootRoute,
        pageBuilder: (context, state) => const SplashScreen(),
      ),
      transitionGoRoute(
        path: Routes.getStarted,
        pageBuilder: (context, state) => const GetStartedScreen(),
      ),
      transitionGoRoute(
        path: Routes.chooseMode,
        pageBuilder: (context, state) => const ChooseModeScreen(),
      ),
      transitionGoRoute(
        path: Routes.signupOrSignin,
        pageBuilder: (context, state) => const SignupOrSigninScreen(),
      ),
      transitionGoRoute(
        path: Routes.signIn,
        pageBuilder: (context, state) => SigninScreen(),
      ),
      transitionGoRoute(
        path: Routes.siginUp,
        pageBuilder: (context, state) => SignupScreen(),
      ),
      transitionGoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => const HomeScreen(),
      ),
      transitionGoRoute(
        path: Routes.songPlayer,
        pageBuilder: (context, state) {
          final song = SongEntity.fromJson(state.uri.queryParameters);
          return SongPlayerScreen(song: song);
        },
      ),
      transitionGoRoute(
        path: Routes.profile,
        pageBuilder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}

GoRoute transitionGoRoute({
  required String path,
  required Widget Function(BuildContext, GoRouterState) pageBuilder,
}) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: pageBuilder(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ),
  );
}
