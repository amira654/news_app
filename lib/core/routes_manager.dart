import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../news_app.dart';
import '../presentation/home/home.dart';

class RoutesManager {
  static const String home = '/home';
  static const String search = '/search';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return CupertinoPageRoute(
            builder: (_) => const Home());


    }
    return null;
  }
}
