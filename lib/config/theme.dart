import 'package:flutter/material.dart';
import 'package:jobspot/constants/colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.primary,
      // useMaterial3: true,
      errorColor: Colors.redAccent,
      scaffoldBackgroundColor: const Color.fromARGB(255, 248, 246, 246),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        errorMaxLines: 2,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFABB0C9),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 46,
        ),
        headline2: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
          fontSize: 36,
        ),
        // bodyText1: TextStyle(color: Colors.green),
        bodyText2: TextStyle(
          color: Color(0xFF0D0140),
          fontWeight: FontWeight.bold,
        ),
      ),
      unselectedWidgetColor: Colors.red,
      sliderTheme: const SliderThemeData(
        activeTrackColor: Colors.orange,
        inactiveTrackColor: Colors.grey,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(400, 50)),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.white),
        checkColor: MaterialStateProperty.all(Colors.orangeAccent),
        side: MaterialStateBorderSide.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const BorderSide(color: Colors.orangeAccent, width: 2);
          } else {
            return const BorderSide(color: Color(0xFF524B6B), width: 2);
          }
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.orange;
          } else {
            return const Color(0xFF524B6B);
          }
        }),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: const Color.fromARGB(255, 167, 156, 216),
        primary: AppColors.primary,
      ),
    );
  }
}
