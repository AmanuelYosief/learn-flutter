import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/models/news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newslist;

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          actions: [
            Container(padding: EdgeInsets.all(10), child: Icon(Icons.search))
          ],
          centerTitle: true,
          title: Text(
            'Daily News',
            style: TextStyle(fontSize: 25),
          ),
          elevation: 0.0,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Category',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 23,
              ),
            ),

            //  Category Section
            //  NewList
            //  Now we create the singular models

            Container(
              height: 120,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newslist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewTitle(),
                  );
                  //This returns a Category Card;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Latest News',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 23,
              ),
            ),

            Container(
              height: 120,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: categorieslist.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CategoryCard(
                      imgUrl: categorieslist.categories[index].imageAssetUrl,
                      categoryName:
                          categorieslist.categories[index].categoryname,
                    ),
                  );
                  //This returns a Category Card;
                },
              ),
            ),
          ],
        ));
  }
}

class CategoryCard extends StatelessWidget {
  final String imgUrl, categoryName;

  CategoryCard({this.imgUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            height: 300,
            width: 180,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 300,
          width: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black38, borderRadius: BorderRadius.circular(10)),
          child: Text(
            '$categoryName',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
