import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/categories_view/categories_view.dart';

import '../models/category_model.dart';
import '../presentation/home/sources_view/sources_view.dart';

class HomeProvider extends ChangeNotifier{
  String homeTitle = "Home";

  Widget view = CategoriesView();
  void goToSourcesView(CategoryModel category){
    view = SourcesView(category: category,);
    homeTitle = category.title;
    notifyListeners();
  }
 void goToCategoriesView(){
    if(view == CategoriesView()) return;
    view = CategoriesView();
    homeTitle = "Home";
    notifyListeners();
  }

}