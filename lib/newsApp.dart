import 'package:demo/components/customListTile.dart';
import 'package:demo/constants/constant.dart';
import 'package:demo/model/article_model.dart';
import 'package:demo/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: NewsApp()));
}

// Wrap main widget inside the StreamProvider
class NewsApp extends StatefulWidget {
  NewsApp({Key key}) : super(key: key);

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          centerTitle: true,
          title: Text('News List'),
        ),
        body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data;
              return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      customListTile(articles[index], context));
            }
            return isConnected == true
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation(Colors.red[400]),
                    ),
                  )
                : Center(child: Text('Internet not connected'));
          },
        ),
      ),
    );
  }
}
