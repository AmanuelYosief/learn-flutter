import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<Article> news = [];

  // A future method that doesn't return a value and waits to get the latest news
  Future<void> getNews() async {
    String url = 'http://newsapi.org/v2/top-headlines?' +
        'country=us&apiKey=d78a011d74e34f5ca28dc7769b89929f';

    var response = await http.get(url);
    //  Converts the body of the response into a json format
    var jsonData = jsonDecode(response.body);

    // If the response from the api is successful
    if (jsonData['status'] == 'ok') {
      // Loop through each articles
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          //  For each validated article, create and store it in an article object

          Article article = Article(
              title: element['title'],
              author: element['author'],
              published: DateTime.parse(element['publishedAt']),
              imgUrl: element['urlToImage'],
              content: element['content'],
              articleUrl: element['url'],
              description: element['description']);
          //  Then store it into news --> a object of articles
          news.add(article);
        }
      });
    }
  }
}

class CategoryNews {
  List<Article> news = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=d78a011d74e34f5ca28dc7769b89929f';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
              title: element['title'],
              author: element['author'],
              published: DateTime.parse(element['publishedAt']),
              imgUrl: element['urlToImage'],
              content: element['content'],
              articleUrl: element['url'],
              description: element['description']);
          news.add(article);
        }
      });
    }
  }
}
