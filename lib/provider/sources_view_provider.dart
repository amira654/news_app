import 'package:flutter/material.dart';

import '../api_services/api_services.dart';
import '../models/category_model.dart';
import '../models/sources_response/Source.dart';

class SourcesViewProvider extends ChangeNotifier {
  List<Source> sources = [];

  Future<void> loadSources(CategoryModel category) async {
    sources = await ApiServices.getSources(category);
    notifyListeners();
  }
}
