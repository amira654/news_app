import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/home/sources_view/article.dart';
import 'package:news_app/provider/sources_view_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/error_state_widget.dart';
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
    articlesViewProvider.loadArticles(
        (sourcesViewProvider.state as SourcesSuccessState).sources[0]);
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
                var state = sourcesViewProvider.state;
                switch (state) {
                  case SourcesSuccessState():
                    return DefaultTabController(
                      length: state.sources.length,
                      child: TabBar(
                        onTap: (index) {
                          articlesViewProvider.loadArticles(
                            state.sources[index],
                          );
                        },
                        isScrollable: true,
                        tabs: state.sources
                            .map((source) => Tab(text: source.name))
                            .toList(),
                      ),
                    );
                  case SourcesLoadingState():
                    return const Center(child: CircularProgressIndicator());
                  case SourcesErrorState():
                    return ErrorStateWidget(
                      serverError: state.serverError,
                      exception: state.exception,
                    );
                }
              },
            ),
            SizedBox(height: 16.h),
            Consumer<ArticlesViewProvider>(
              builder: (context, articlesViewProvider, child) {
                var state = articlesViewProvider.state;
                switch (state) {
                  case ArticlesSuccessState():
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8.h),
                        itemBuilder: (context, index) =>
                            ArticleItem(article: state.articles[index]),
                        itemCount: state.articles.length,
                      ),
                    );
                  case ArticlesLoadingState():
                    return const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    );
                  case ArticlesErrorState():
                    return ErrorStateWidget(
                      serverError: state.serverError,
                      exception: state.exception,
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
