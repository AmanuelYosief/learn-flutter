class CategoryModel {
  // This powerups the view model for the Category. 
  // Each category has a name and a background image

  String imageAssetUrl;
  String categoryname;

  //  Initialize the categorie
  CategoryModel({this.imageAssetUrl, this.categoryname});
}

  // A class to contain a list of all our categories of type category
class Categories {
  List<CategoryModel> categories;

  Categories({this.categories});
}


  // Defining the list of category (models) that will be put into Categories. 
Categories categorieslist = Categories(categories: [
  CategoryModel(
      categoryname: 'Business',
      imageAssetUrl:
          "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"),
  CategoryModel(
      categoryname: 'Entertainment',
      imageAssetUrl:
          "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
  CategoryModel(
      categoryname: 'General',
      imageAssetUrl:
          "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
  CategoryModel(
      categoryname: 'Health',
      imageAssetUrl:
          "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80"),
  CategoryModel(
      categoryname: 'Science',
      imageAssetUrl:
          "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80"),
  CategoryModel(
      categoryname: 'Sports',
      imageAssetUrl:
          "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"),
]);


