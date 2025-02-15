import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../lib_src.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return MultiBlocProvider(
            providers: AppBloc.providers,
            child: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, mode) {
                return GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                      currentFocus.focusedChild!.unfocus();
                    }
                  },
                  child: MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    routerConfig: AppRouter.router,
                    themeMode: mode,
                    theme: AppTheme.light().data,
                    darkTheme: AppTheme.dark().data,
                    builder: EasyLoading.init(),
                  ),
                );
              },
            ),
          );
        });
  }
}
