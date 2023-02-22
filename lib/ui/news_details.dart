import 'package:flutter/material.dart';
import 'package:newsapi/model/article_model.dart';

class NewsDetails extends StatefulWidget {
  final ArticleModel articleModel;

  const NewsDetails({Key? key, required this.articleModel}) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articleModel.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.articleModel.urlToImage ??
                  "https://mybiros.com/wp-content/themes/qik/assets/images/no-image/No-Image-Found-400x264.png",
              fit: BoxFit.fitWidth,
              height: 250,
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                widget.articleModel.source!.name.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.articleModel.description.toString(),
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
