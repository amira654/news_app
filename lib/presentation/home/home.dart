import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/home/home_drawer/home_drawer.dart';
import 'package:provider/provider.dart';

import '../../core/routes_manager.dart';
import '../../provider/home_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesManager.search);
              },
              icon: const Icon(Icons.search)),
          SizedBox(
            width: 20.w,
          )
        ],
        title: Text(homeProvider.homeTitle),
      ),
      drawer: HomeDrawer(),
      body: homeProvider.view,
    );
  }
}
