import 'package:flutter/material.dart';
import 'package:newsapi/model/article_model.dart';
import 'package:newsapi/ui/news_details.dart';

class NewsListItem extends StatelessWidget {
  final ArticleModel articleModel;

  const NewsListItem({Key? key, required this.articleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(
                      articleModel: articleModel,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              articleModel.urlToImage ??
                  "https://mybiros.com/wp-content/themes/qik/assets/images/no-image/No-Image-Found-400x264.png",
              fit: BoxFit.fitWidth,
              height: 250,
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    articleModel.source!.name.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(articleModel.publishedAt.toString())
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(articleModel.title.toString())
          ],
        ),
      ),
    );
  }
}
