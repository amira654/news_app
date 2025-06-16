import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/articles_response/Article.dart';
import '../../../models/articles_response/ArticlesResponse.dart';

class SearchArticlesDataSource {
  static const String _baseUrl = "newsapi.org";
  static const String _apiKey = "b5a77d78166b40b6a024e5217c973aac";
  static const String _articlesEndPoint = "/v2/everything";

  Future<List<Article>> getSearchedArticles(
      {required String searchQuery}) async {
    Uri url = Uri.https(_baseUrl, _articlesEndPoint, {
      "apiKey": _apiKey,
      "q": searchQuery,
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    if (articlesResponse.status == "ok" && response.statusCode == 200) {
      return articlesResponse.articles!;
    } else {
      throw articlesResponse.message ?? 'something went wrong';
    }
  }
}
