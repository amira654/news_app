import 'package:news_app/core/assets_manager.dart';

class CategoryModel {
  final String id;
  final String title;
  final String imagePath;

  const CategoryModel(
      {required this.id, required this.title, required this.imagePath});

  static List<CategoryModel> _getCategories() {
    return const [
      CategoryModel(
          id: "business",
          title: "Business",
          imagePath: AssetsManager.businessLight),
      CategoryModel(
          id: "general",
          title: "General",
          imagePath: AssetsManager.generalLight),
      CategoryModel(
          id: "sports", title: "Sports", imagePath: AssetsManager.sportsLight),
      CategoryModel(
          id: "technology",
          title: "Technology",
          imagePath: AssetsManager.technologyLight),
      CategoryModel(
          id: "entertainment",
          title: "Entertainment",
          imagePath: AssetsManager.entertainmentLight),
      CategoryModel(
          id: "health", title: "Health", imagePath: AssetsManager.healthLight),
      CategoryModel(
          id: "science",
          title: "Science",
          imagePath: AssetsManager.scienceLight),
    ];
  }

  static List<CategoryModel> categories = _getCategories();
}
