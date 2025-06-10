import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/category_model.dart';
import 'category_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.bodyMedium,
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
