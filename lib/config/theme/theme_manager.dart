import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors_manager.dart';

class ThemeManager {
  static final light = ThemeData();
  static final dark = ThemeData(
    tabBarTheme: TabBarTheme(
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
        fontWeight: FontWeight.w500,
        color: ColorsManager.white
      ),

    )

  );



}
