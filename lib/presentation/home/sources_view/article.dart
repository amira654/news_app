import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/assets_manager.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key,required this.article});

  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
            color: ColorsManager.white,
            width: 1.w
        ),

      ),
      child: Column(
        children: [
          Image.asset(AssetsManager.articleImage),
          SizedBox(height: 10.h,),
          Text(article.title,style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.white
          ),),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(article.auther,style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.grey
              ),), Text(article.publishedAt,style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.grey
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
