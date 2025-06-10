import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/presentation/home/sources_view/article.dart';

import '../../../core/assets_manager.dart';
import '../../../models/article_model.dart';
import '../../../models/source_model.dart';

class SourcesView extends StatelessWidget {
  SourcesView({super.key});
  List<SourceModel> sources = [
    SourceModel(
      id: "1",
      name: "ABC News",
    ),
    SourceModel(
      id: "1",
      name: "ABC News",
    ),
    SourceModel(
      id: "1",
      name: "ABC News",
    ),
    SourceModel(
      id: "1",
      name: "ABC News",
    ),
    SourceModel(
      id: "1",
      name: "ABC News",
    ),
    SourceModel(
      id: "1",
      name: "ABC News",
    ),
    SourceModel(
      id: "1",
      name: "ABC News",
    ),
    SourceModel(
      id: "1",
      name: "ABC News",
    ),
    SourceModel(
      id: "1",
      name: "ABC News",
    ),
    SourceModel(
      id: "1",
      name: "ABC News",
    ),
  ];
  List<ArticleModel>  articles = [
    ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park", imagePath: AssetsManager.articleImage, auther: "By : Jon Haworth", publishedAt: "15 minutes ago"),
    ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park", imagePath: AssetsManager.articleImage, auther: "By : Jon Haworth", publishedAt: "15 minutes ago"),
    ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park", imagePath: AssetsManager.articleImage, auther: "By : Jon Haworth", publishedAt: "15 minutes ago"),
    ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park", imagePath: AssetsManager.articleImage, auther: "By : Jon Haworth", publishedAt: "15 minutes ago"),
    ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park", imagePath: AssetsManager.articleImage, auther: "By : Jon Haworth", publishedAt: "15 minutes ago"),
    ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park", imagePath: AssetsManager.articleImage, auther: "By : Jon Haworth", publishedAt: "15 minutes ago"),
    ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park", imagePath: AssetsManager.articleImage, auther: "By : Jon Haworth", publishedAt: "15 minutes ago"),
    ArticleModel(title: "40-year-old man falls 200 feet to his death while canyoneering at national park", imagePath: AssetsManager.articleImage, auther: "By : Jon Haworth", publishedAt: "15 minutes ago"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: 10,
          child: TabBar(

              isScrollable: true,
              tabs: sources.map((source) => Tab(text: source.name)).toList()),
        ),
        SizedBox(height: 16.h,),
        Expanded(child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 16.h,),
          itemCount: articles.length,
          itemBuilder: (context, index) =>ArticleItem(article: articles[index],),

        ),)
      ],
    );
  }
}
