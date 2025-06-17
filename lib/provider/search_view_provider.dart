import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/articles_response/Article.dart';
import '../presentation/search/data-source/searched_articles_data_source.dart';

class SearchViewProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  final SearchArticlesDataSource articlesDataSource =
      SearchArticlesDataSource();
  final ScrollController scrollController = ScrollController();

  List<Article> newArticles = [];
  bool loading = false;
  String? errorMessage;
  int page = 1;
  bool paginationLoading = false;

  SearchViewProvider() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop && !paginationLoading) {
          page++;
          paginationLoading = true;
          notifyListeners();
          searchArticles();
        }
      }
    });
  }
  Future<void> searchArticles() async {
    List<Article> searchedArticles = [];
    errorMessage = null;
    if (newArticles.isEmpty) {
      loading = true;
      notifyListeners();
    }

    try {
      searchedArticles = await articlesDataSource.getSearchedArticles(
          searchQuery: searchController.text, page: page);
      newArticles.addAll(searchedArticles);
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
    paginationLoading = false;
    notifyListeners();
  }
}
