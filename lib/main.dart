import 'package:flutter/material.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'news_app.dart';

void main(){
  runApp(ChangeNotifierProvider(
      create: (context) => HomeProvider(),
  child: const NewsApp()));
}