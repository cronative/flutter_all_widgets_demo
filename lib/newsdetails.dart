import 'package:demo/model/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: NewsDetails()));
}

class NewsDetails extends StatelessWidget {
  final Article article;

  NewsDetails({this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: Text(article.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              article?.urlToImage != null
                  ? Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(article.urlToImage),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    )
                  : Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/placeholder.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
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
                  article.source.name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                article.description != null
                    ? article.description
                    : article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
