import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  // Update the theme mode
  void updateTheme(ThemeMode themeMode) {
    emit(themeMode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    switch (json['themeMode']) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  // Serialize the ThemeMode to JSON
  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // Return the themeMode as a string in the JSON
    return {
      'themeMode': state.toString().split('.').last, // Get the string value of the enum
    };
  }
}
