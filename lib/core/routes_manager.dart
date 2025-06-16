import 'package:flutter/cupertino.dart';
import 'package:news_app/provider/search_view_provider.dart';
import 'package:provider/provider.dart';

import '../presentation/home/home.dart';
import '../presentation/search/search.dart';

class RoutesManager {
  static const String home = '/home';
  static const String search = '/search';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return CupertinoPageRoute(builder: (_) => const Home());
      case search:
        return CupertinoPageRoute(
            builder: (_) => ChangeNotifierProvider(
                create: (context) => SearchViewProvider(),
                child: const Search()));
    }
    return null;
  }
}
