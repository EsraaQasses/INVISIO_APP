import 'package:flutter/material.dart';
import 'package:invisio_app/core/style/repo.dart';

class AppStyle {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: StyleRepo.lightblue,
      scaffoldBackgroundColor: StyleRepo.white,
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: StyleRepo.blue, // لون الكتابة
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: StyleRepo.green);
            }
            return IconThemeData(color: StyleRepo.darkGrey);
          },
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
    );
  }
}
