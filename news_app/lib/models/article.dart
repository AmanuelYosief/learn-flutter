class Article {
  // Every article is going to have

  String title;
  String author;
  String description;
  String imgUrl;
  DateTime published;
  String content;
  String articleUrl;

  //  Initialize the class
  Article(
      {this.title,
      this.description,
      this.author,
      this.content,
      this.published,
      this.articleUrl,
      this.imgUrl});
}
