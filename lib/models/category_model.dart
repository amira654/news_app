import 'package:news_app/core/assets_manager.dart';

class CategoryModel {
  final String id;
  final String title;
  final String imagePath;
  final String imagePathLight;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.imagePathLight,
  });

  static List<CategoryModel> categories = _getCategories();

  static List<CategoryModel> _getCategories() => [
        CategoryModel(
          id: "sports",
          title: "Sports",
          imagePath: AssetsManager.sports,
          imagePathLight: AssetsManager.sportsDark,
        ),
        CategoryModel(
          id: "entertainment",
          title: "Entertainment",
          imagePath: AssetsManager.entertainment,
          imagePathLight: AssetsManager.entertainmentDark,
        ),
        CategoryModel(
          id: "business",
          title: "Business",
          imagePath: AssetsManager.business,
          imagePathLight: AssetsManager.businessDark,
        ),
        CategoryModel(
          id: "science",
          title: "Science",
          imagePath: AssetsManager.science,
          imagePathLight: AssetsManager.scienceDark,
        ),
        CategoryModel(
          id: "technology",
          title: "Technology",
          imagePath: AssetsManager.tech,
          imagePathLight: AssetsManager.techDark,
        ),
        CategoryModel(
          id: "health",
          title: "Health",
          imagePath: AssetsManager.health,
          imagePathLight: AssetsManager.healthDark,
        ),
        CategoryModel(
          id: "general",
          title: "General",
          imagePath: AssetsManager.general,
          imagePathLight: AssetsManager.generalDark,
        ),
      ];
}
