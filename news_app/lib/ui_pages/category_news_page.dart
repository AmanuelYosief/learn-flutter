import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/ui_page_widgets/newstile.dart';

class CategoryNewsPage extends StatefulWidget {
  final String newsCategory;
  final String category;
  CategoryNewsPage({this.newsCategory, this.category});

  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  bool _loading;

  var newslist;

  // To get the list of news
  void getNews() async {
    CategoryNews news = CategoryNews(); // new Instant of the News class
    await news.getCategoryNews(
        widget.newsCategory); //  Asynchrnonously wait for news class to getNews
    newslist = news.news; // Fill our news list

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: _loading
            ? CircularProgressIndicator()
            : ListView(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.category,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 23,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1),
                    child: ListView.builder(
                      itemCount: newslist.length,
                      shrinkWrap: true,
                      physics:
                          ScrollPhysics(), // After ShrinkWrap and Phsyics, you can remove Container Height
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NewsTile(
                            title: newslist[index].title,
                            subtitle: newslist[index].description,
                            imgUrl: newslist[index].imgUrl,
                            articleUrl: newslist[index].articleUrl,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }
}
