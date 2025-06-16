import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/search/widgets/custom_search_bar.dart';
import 'package:news_app/provider/search_view_provider.dart';
import 'package:provider/provider.dart';

import '../home/sources_view/article.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 80.h,
            title: const CustomSearchBar(),
          ),
          Consumer<SearchViewProvider>(builder: (context, viewModel, child) {
            if (viewModel.loading) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (viewModel.errorMessage != null) {
              return SliverFillViewport(
                delegate: SliverChildListDelegate(
                    [Center(child: Text(viewModel.errorMessage!))]),
              );
            }
            if (viewModel.searchedArticles.isEmpty) {
              return SliverFillViewport(
                delegate: SliverChildListDelegate(
                    [Center(child: Text("No articles found"))]),
              );
            }
            return SliverList.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 16.h,
              ),
              itemCount: viewModel.searchedArticles.length,
              itemBuilder: (context, index) {
                final article = viewModel.searchedArticles[index];
                return ArticleItem(
                  article: article,
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
