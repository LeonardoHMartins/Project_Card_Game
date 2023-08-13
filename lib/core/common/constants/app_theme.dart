import 'package:flutter/material.dart';
import 'package:project_card_game/core/common/constants/app_colors.dart';
import 'package:project_card_game/core/common/extensions/color_extension.dart';

/// > A class that contains all the colors used in the app
class AppTheme {
  static ThemeData get dark => ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: AppColors.primaryColor.toMaterialColor(),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.primaryColor,
          cursorColor: AppColors.primaryColor,
          selectionColor: AppColors.primaryColor.withOpacity(0.2),
        ),
      ).copyWith(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        canvasColor: AppColors.primaryColor,
        primaryColor: AppColors.primaryColor,
        colorScheme: const ColorScheme.dark().copyWith(
          secondary: AppColors.primaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.backgroundColor,
          isDense: false,
          prefixIconColor: AppColors.grey,
          labelStyle: const TextStyle(
            color: AppColors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(
            color: AppColors.grey.withOpacity(0.6),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: AppColors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: AppColors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          //DISABLE  ------
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: AppColors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          //ERROR  ------
          errorStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.red),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      );
}
