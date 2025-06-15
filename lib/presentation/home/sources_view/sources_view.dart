import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/sources_response/Source.dart';
import 'package:news_app/presentation/home/sources_view/article.dart';
import 'package:news_app/provider/sources_view_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/articles_response/Article.dart';
import '../../../models/category_model.dart';
import '../../../provider/article_view_provider.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.category});
  final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewProvider sourcesViewProvider;
  late ArticlesViewProvider articlesViewProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    sourcesViewProvider = SourcesViewProvider();
    articlesViewProvider = ArticlesViewProvider();
    await sourcesViewProvider.loadSources(widget.category); // blocking
    articlesViewProvider.loadArticles(sourcesViewProvider.sources[0]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewProvider),
        ChangeNotifierProvider.value(value: articlesViewProvider),
      ],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer<SourcesViewProvider>(
              builder: (context, sourcesViewProvider, child) {
                List<Source> sources = sourcesViewProvider.sources;
                return DefaultTabController(
                  length: sources.length,
                  child: TabBar(
                    onTap: (index) {
                      articlesViewProvider.loadArticles(
                        sourcesViewProvider.sources[index],
                      );
                    },
                    isScrollable: true,
                    tabs: sources
                        .map((source) => Tab(text: source.name))
                        .toList(),
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            Consumer<ArticlesViewProvider>(
              builder: (context, articlesViewProvider, child) {
                List<Article> articles = articlesViewProvider.articles;
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 8.h),
                    itemBuilder: (context, index) =>
                        ArticleItem(article: articles[index]),
                    itemCount: articles.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
