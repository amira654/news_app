import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/home_drawer/home_drawer.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(homeProvider.homeTitle),
      ),
      drawer: HomeDrawer(),
      body: homeProvider.view,
    );
  }
}
