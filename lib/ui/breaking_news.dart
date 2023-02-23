import 'package:flutter/material.dart';

import '../component/news_lits_item.dart';
import '../model/article_model.dart';
import '../service/api_service.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getBreakingNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ArticleModel> articleModel = snapshot.data ?? [];
            return ListView.builder(itemBuilder: (context, index) {
              return NewsListItem(
                articleModel: articleModel[index],
              );
            },itemCount: articleModel.length,);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
