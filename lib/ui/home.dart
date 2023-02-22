import 'package:flutter/material.dart';
import 'package:newsapi/model/article_model.dart';
import 'package:newsapi/service/api_service.dart';
import 'package:newsapi/ui/all_news.dart';
import 'package:newsapi/ui/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "News App",
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Breaking",
              ),
              Tab(
                text: "All News",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BreakingNews(),
            AllNews()
          ],
        ),),
    );
  }
}

