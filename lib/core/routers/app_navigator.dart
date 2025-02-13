import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_bloc/presentation/auth/pages/signin_screen.dart';
import 'package:spotify_bloc/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify_bloc/presentation/auth/pages/signup_screen.dart';
import 'package:spotify_bloc/presentation/choose_mode/choose_mode_screen.dart';
import 'package:spotify_bloc/presentation/intro/screen/get_started_screen.dart';
import 'package:spotify_bloc/presentation/splash/screen/splash.dart';

import 'app_routes.dart';

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
        pageBuilder: (context, state) => const SigninScreen(),
      ),
      transitionGoRoute(
        path: Routes.siginUp,
        pageBuilder: (context, state) => const SignupScreen(),
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
