import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/theme_manager.dart';
import 'package:news_app/core/extentions/context_extention.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'core/routes_manager.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);

    return ScreenUtilInit(
      designSize:  Size(context.width, context.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.router,
          initialRoute: RoutesManager.home,
          theme: ThemeManager.light,
          darkTheme: ThemeManager.dark,
          themeMode: homeProvider.currentTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          locale: Locale(homeProvider.currentLang),
        );
      },
    );
  }
}
