import 'package:flutter/material.dart';
import 'package:news_app/core/result.dart';

import '../api_services/api_services.dart';
import '../models/category_model.dart';
import '../models/sources_response/Source.dart';

class SourcesViewProvider extends ChangeNotifier {
  SourcesState state = SourcesLoadingState();

  void emit(SourcesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadSources(CategoryModel category) async {
    emit(SourcesLoadingState(loadingMsg: "Loading..."));
    var result = await ApiServices.getSources(category);
    switch (result) {
      case Success<List<Source>>():
        emit(SourcesSuccessState(sources: result.data));
      case ServerError<List<Source>>():
        emit(SourcesErrorState(serverError: result));
      case GeneralEx<List<Source>>():
        emit(SourcesErrorState(exception: result.exception));
    }
  }
}

sealed class SourcesState {}

class SourcesSuccessState extends SourcesState {
  List<Source> sources;

  SourcesSuccessState({required this.sources});
}

class SourcesLoadingState extends SourcesState {
  String? loadingMsg;

  SourcesLoadingState({this.loadingMsg});
}

class SourcesErrorState extends SourcesState {
  ServerError? serverError;
  Exception? exception;

  SourcesErrorState({this.serverError, this.exception});
}
