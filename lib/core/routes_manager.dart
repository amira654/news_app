import 'package:flutter/cupertino.dart';

import '../presentation/home/home.dart';
import '../presentation/search/search.dart';

class RoutesManager {
  static const String home = '/home';
  static const String search = '/search';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return CupertinoPageRoute(
            builder: (_) => const Home());
      case search:
        return CupertinoPageRoute(builder: (_) => const Search());
    }
    return null;
  }
}
