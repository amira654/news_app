import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/articles_response/Article.dart';
import '../presentation/search/data-source/searched_articles_data_source.dart';

class SearchViewProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  final SearchArticlesDataSource articlesDataSource =
      SearchArticlesDataSource();

  List<Article> searchedArticles = [];
  bool loading = false;
  String? errorMessage;

  Future<void> searchArticles() async {
    searchedArticles = [];
    errorMessage = null;
    loading = true;
    notifyListeners();

    try {
      searchedArticles = await articlesDataSource.getSearchedArticles(
          searchQuery: searchController.text);
    } on ClientException catch (e) {
      errorMessage = e.message;
    } catch (e) {
      if (e is TypeError) {
        errorMessage = "Error Formating ";
      } else {
        errorMessage = e is String ? e : "something went wrong";
      }
    }
    loading = false;
    notifyListeners();
  }
}
