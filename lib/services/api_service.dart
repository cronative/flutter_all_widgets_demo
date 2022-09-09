import 'dart:convert';
import 'dart:io';
import 'package:demo/constants/constant.dart';
import 'package:demo/model/article_model.dart';
import 'package:demo/model/users.dart';
import 'package:demo/services/api_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String userUrl = 'jsonplaceholder.typicode.com';
  final endPointUrl = "newsapi.org";
  final client = http.Client();
  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'us',
      'category': 'business',
      'apiKey': '453ef7e602e64d47906dfd7e7dd978fd'
    };
    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.https(userUrl, '/users'));
      if (200 == response.statusCode) {
        final List<User> users = usersFromJson(_returnResponse(response));
        return users;
      } else {
        return [];
      }
    } on SocketException {
      showToast("No Internet connection", "LENGTH_LONG", "TOP", Colors.black,
          Colors.white, 16.0);
      throw FetchDataException('No Internet connection');
    }
  }

  static Future sendUser(Map data) async {
    try {
      String body = json.encode(data);
      final response = await http.post(
        Uri.https(userUrl, '/users'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (200 == response.statusCode) {
      } else {}
    } catch (e) {}
  }

  static _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        showToast(response.body.toString(), "LENGTH_LONG", "TOP", Colors.black,
            Colors.white, 16.0);
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        showToast(response.body.toString(), "LENGTH_LONG", "TOP", Colors.black,
            Colors.white, 16.0);
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        showToast(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
            "LENGTH_LONG",
            "TOP",
            Colors.black,
            Colors.white,
            16.0);
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
