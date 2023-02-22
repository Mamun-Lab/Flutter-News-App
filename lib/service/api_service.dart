import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapi/model/article_model.dart';

class ApiService {
  final all_news_url =
      "https://newsapi.org/v2/everything?q=Apple&from=2023-02-22&sortBy=popularity&apiKey=4ebc144ba1d845e192540df6bd2526cd";

  final breaking_news_url =
      "https://newsapi.org/v2/everything?q=Apple&from=2023-02-22&sortBy=popularity&apiKey=4ebc144ba1d845e192540df6bd2526cd";

  Future<List<ArticleModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<ArticleModel> articles =
        body.map((dynamic item) => ArticleModel.fromJson(item)).toList();
        return articles;
      } else {
        throw ("No artile found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<List<ArticleModel>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breaking_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<ArticleModel> articles =
        body.map((dynamic item) => ArticleModel.fromJson(item)).toList();
        return articles;
      } else {
        throw ("No artile found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
