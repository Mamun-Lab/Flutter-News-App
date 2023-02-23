import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/model/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

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
            CachedNetworkImage(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 250,
              imageUrl: widget.articleModel.urlToImage.toString(),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // Image.network(
            //   widget.articleModel.urlToImage ??
            //       "https://mybiros.com/wp-content/themes/qik/assets/images/no-image/No-Image-Found-400x264.png",
            //   fit: BoxFit.fitWidth,
            //   width: double.infinity,
            //   height: 250,
            // ),
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
                    widget.articleModel.source!.name.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(widget.articleModel.publishedAt.toString())
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "Written by " + widget.articleModel.author.toString(),
              style: TextStyle(fontSize: 15),
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
            ),

            SizedBox(
              height: 8.0,
            ),

            Text(
              widget.articleModel.content.toString(),
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    final Uri _url = Uri.parse(widget.articleModel.url.toString());
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
                  },
                  child: Text("Read More...")),
            )
          ],
        ),
      ),
    );
  }
}
