import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        controller: context.read<SearchViewProvider>().scrollController,
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
            if (viewModel.newArticles.isEmpty) {
              return SliverFillViewport(
                delegate: SliverChildListDelegate([
                  Center(
                      child:
                          Text(AppLocalizations.of(context)!.no_search_result))
                ]),
              );
            }
            return SliverList.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 16.h,
              ),
              itemCount: viewModel.newArticles.length +
                  (viewModel.paginationLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (viewModel.paginationLoading &&
                    index == viewModel.newArticles.length) {
                  return Padding(
                    padding: REdgeInsets.all(16.0),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                final article = viewModel.newArticles[index];
                return Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8.0),
                  child: ArticleItem(
                    article: article,
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
