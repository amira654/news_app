import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/provider/search_view_provider.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchViewProvider>().searchController,
      keyboardType: TextInputType.text,
      onSubmitted: (value) {
        context.read<SearchViewProvider>().searchArticles();
      },
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
          ),
          hintText: "Search",
          hintStyle: Theme.of(context).textTheme.labelMedium,
          prefixIcon:
              Icon(Icons.search, color: Theme.of(context).primaryColorDark),
          suffixIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close_rounded,
              color: Theme.of(context).primaryColorDark,
            ),
          )),
    );
  }
}
