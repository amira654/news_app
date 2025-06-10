import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/home_drawer/home_drawer.dart';
import 'package:news_app/presentation/home/sources_view/sources_view.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';
import 'categories_view/categories_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: HomeDrawer(),
      body: homeProvider.view,
    );
  }
}
