import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/sources_response/SorcesResponse.dart';
import 'package:news_app/models/sources_response/Source.dart';

import '../models/articles_response/Article.dart';
import '../models/articles_response/ArticlesResponse.dart';

class ApiServices {
  static const String _baseUrl = "newsapi.org";
  static const String _apiKey = "b5a77d78166b40b6a024e5217c973aac";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articlesEndPoint = "/v2/everything";

  static Future<List<Source>> getSources(CategoryModel category) async {
    Uri url = Uri.https(_baseUrl, _sourcesEndPoint,
        {"apiKey": _apiKey, "category": category.id});
    var response = await http.get(url);

    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse.sources!;
  }

  static Future<List<Article>> getArticles(Source source) async {
    Uri url = Uri.https(_baseUrl, _articlesEndPoint, {
      "apiKey": _apiKey,
      "sources": source.id,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse.articles!;
  }
}
