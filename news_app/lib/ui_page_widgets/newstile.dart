import 'package:flutter/material.dart';
import 'package:news_app/ui_pages/article_page.dart';

class NewsTile extends StatelessWidget {
  final String title, imgUrl, subtitle, articleUrl;

  NewsTile({this.title, this.subtitle, this.imgUrl, this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Enable for tap and interaction, to be able view the whole story in a
      // separate widget
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetail(
                postUrl: articleUrl,
              ),
            ));
      },
      child: Container(
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            maxLines: 2,
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imgUrl,
              width: 60,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
