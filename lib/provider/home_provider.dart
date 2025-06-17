import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/categories_view/categories_view.dart';

import '../models/category_model.dart';
import '../presentation/home/sources_view/sources_view.dart';

class HomeProvider extends ChangeNotifier{
  String homeTitle = "Home";
  ThemeMode currentTheme = ThemeMode.light;
  String currentLang = "en";

  bool get isDark => currentTheme == ThemeMode.dark;

  bool get isEnglish => currentLang == "en";

  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeAppLang(String newLang) {
    if (currentLang == newLang) return;
    currentLang = newLang;
    if (view is CategoriesView) {
      isEnglish ? homeTitle = "Home" : homeTitle = "الرئيسية";
    }
    notifyListeners();
  }

  Widget view = const CategoriesView();
  void goToSourcesView(CategoryModel category){
    view = SourcesView(category: category,);
    homeTitle = category.title;
    notifyListeners();
  }
 void goToCategoriesView(){
    if (view == const CategoriesView()) return;
    view = const CategoriesView();
    homeTitle = isEnglish ? "Home" : "الرئيسية";
    notifyListeners();
  }

}