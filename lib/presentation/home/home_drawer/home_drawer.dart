import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/extentions/context_extention.dart';
import 'package:provider/provider.dart';

import '../../../provider/home_provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
      ),
      backgroundColor: ColorsManager.black17,
      width: context.width * 0.7,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 166.h,
              color: ColorsManager.white,
              child: Text(
                "News App",
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black17),
              )),
          Padding(
            padding: REdgeInsets.all(16.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    homeProvider.goToCategoriesView();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.home,
                        color: ColorsManager.white,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(AppLocalizations.of(context)!.go_to_home,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: ColorsManager.white,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Divider(
                  color: ColorsManager.white,
                  thickness: 1.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          homeProvider.isDark
                              ? AppLocalizations.of(context)!.dark
                              : AppLocalizations.of(context)!.light,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: ColorsManager.white,
                            fontWeight: FontWeight.bold,
                          )),
                      Switch(
                        value: homeProvider.isDark,
                        onChanged: (value) {
                          homeProvider.changeAppTheme(
                              value ? ThemeMode.dark : ThemeMode.light);
                        },
                        activeColor: ColorsManager.white,
                      ),
                    ]),
                SizedBox(
                  height: 24.h,
                ),
                Divider(
                  color: ColorsManager.white,
                  thickness: 1.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(homeProvider.isEnglish ? "English" : "عربي",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: ColorsManager.white,
                            fontWeight: FontWeight.bold,
                          )),
                      Switch(
                        value: homeProvider.isEnglish,
                        onChanged: (value) {
                          homeProvider.changeAppLang(value ? "en" : "ar");
                        },
                        activeColor: ColorsManager.white,
                      ),
                    ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
