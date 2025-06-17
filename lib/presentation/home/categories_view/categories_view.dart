import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../models/category_model.dart';
import '../../../provider/home_provider.dart';
import 'category_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});


  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    final isEnglish = homeProvider.isEnglish;
    return Padding(
      padding:  REdgeInsets.all(15.0),
      child: Column(
        children: [
          Align(
            alignment: isEnglish ? Alignment.topLeft : Alignment.topRight,
            child: Text(
              AppLocalizations.of(context)!.good_morning,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(child:  ListView.separated(
            separatorBuilder:(context, index) => SizedBox(height: 16.h) ,
            itemCount: CategoryModel.categories.length,
            itemBuilder:(context, index) => CategoryItem(
              category: CategoryModel.categories[index],
            ), ))
        ],
      ),
    );
  }
}
