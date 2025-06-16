import 'package:flutter/material.dart';

import '../api_services/api_services.dart';
import '../core/result.dart';
import '../models/articles_response/Article.dart';
import '../models/sources_response/Source.dart';

class ArticlesViewProvider extends ChangeNotifier {
  ArticlesState state = ArticlesLoadingState();

  void emit(ArticlesState newState) {
    state = newState;
    notifyListeners();
  }

  void loadArticles(Source source) async {
    emit(ArticlesLoadingState());
    var result = await ApiServices.getArticles(source);
    switch (result) {
      case Success<List<Article>>():
        emit(ArticlesSuccessState(articles: result.data));
      case ServerError<List<Article>>():
        emit(ArticlesErrorState(serverError: result));
      case GeneralEx<List<Article>>():
        emit(ArticlesErrorState(exception: result.exception));
    }
  }
}

sealed class ArticlesState {}

class ArticlesSuccessState extends ArticlesState {
  List<Article> articles;

  ArticlesSuccessState({required this.articles});
}

class ArticlesLoadingState extends ArticlesState {
  String? loadingMsg;

  ArticlesLoadingState({this.loadingMsg});
}

class ArticlesErrorState extends ArticlesState {
  ServerError? serverError;
  Exception? exception;

  ArticlesErrorState({this.serverError, this.exception});
}