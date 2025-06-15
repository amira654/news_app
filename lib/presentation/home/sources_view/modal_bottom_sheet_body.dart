import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/colors_manager.dart';
import '../../../models/articles_response/Article.dart';

class modalBottomSheetBody extends StatelessWidget {
  const modalBottomSheetBody({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: REdgeInsets.all(8.0),
          padding: REdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                article.description ?? '',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: ColorsManager.black17,
                    ),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                  onPressed: () {
                    launchUrl(Uri.parse(article.url ?? ''),
                        mode: LaunchMode.inAppWebView);
                  },
                  child: const Text("View Full Article"))
            ],
          ),
        ),
      ],
    );
  }
}
