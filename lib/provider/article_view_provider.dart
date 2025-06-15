import 'package:flutter/material.dart';

import '../api_services/api_services.dart';
import '../models/articles_response/Article.dart';
import '../models/sources_response/Source.dart';

class ArticlesViewProvider extends ChangeNotifier {
  List<Article> articles = [];

  void loadArticles(Source source) async {
    articles = await ApiServices.getArticles(source);
    notifyListeners();
  }
}
