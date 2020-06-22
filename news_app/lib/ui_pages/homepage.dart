import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/ui_page_widgets/newstile.dart';
import 'package:news_app/ui_pages/category_news_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading;

  var newslist;

  // To get the list of news
  void getNews() async {
    News news = News(); // new Instant of the News class
    await news.getNews(); //  Asynchrnonously wait for news class to getNews
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
        body: _loading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Category',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 120,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categorieslist.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CategoryCard(
                            imgUrl:
                                categorieslist.categories[index].imageAssetUrl,
                            categoryName:
                                categorieslist.categories[index].categoryname,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                            articleUrl: newslist[index].articleUrl,
                            title: newslist[index].title,
                            subtitle: newslist[index].description,
                            imgUrl: newslist[index].imgUrl,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }
}

class CategoryCard extends StatelessWidget {
  //  Each category widget has a name and an image associated in it.
  final String imgUrl, categoryName;

  CategoryCard({this.imgUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryNewsPage(
                category: categoryName,
                newsCategory: categoryName.toLowerCase(),
              ),
            ));
      },
      child: Stack(
        children: [
          ClipRRect(
            // Round the edges
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
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
