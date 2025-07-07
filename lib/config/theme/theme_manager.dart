import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors_manager.dart';

class ThemeManager {
  static final light = ThemeData(
    useMaterial3: false,
    primaryColor: ColorsManager.white,
    primaryColorDark: ColorsManager.black17,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.white,
        foregroundColor: ColorsManager.black17,
        padding: REdgeInsets.all(16.0),
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      indicatorColor: ColorsManager.white,
      dividerColor: Colors.transparent,
      labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: ColorsManager.white),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: ColorsManager.white),
    ),
    scaffoldBackgroundColor: ColorsManager.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: ColorsManager.white,
      foregroundColor: ColorsManager.black17,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorsManager.black17,
      ),
      titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.black17),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.black17),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorsManager.black17,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: 12.sp,
        color: ColorsManager.grey,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 18.sp,
        color: ColorsManager.black17,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
  static final dark = ThemeData(
    useMaterial3: false,
    primaryColor: ColorsManager.black17,
    primaryColorDark: ColorsManager.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.black17,
        foregroundColor: ColorsManager.white,
        padding: REdgeInsets.all(16.0),
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      indicatorColor: ColorsManager.white,
      dividerColor: Colors.transparent,
      labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: ColorsManager.white),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: ColorsManager.white),
    ),
    scaffoldBackgroundColor: ColorsManager.black17,
      appBarTheme: AppBarTheme(
    backgroundColor: ColorsManager.black17,
    foregroundColor: ColorsManager.white,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: ColorsManager.white,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: ColorsManager.white
    ),
  ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.white
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontSize: 12.sp,
        color: ColorsManager.grey,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 18.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorsManager.black17,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

}
