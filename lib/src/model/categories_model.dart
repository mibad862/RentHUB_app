class CategoriesModel {
  CategoriesModel({
    required this.categoryName,
    required this.categoryImage,
  });

  String categoryName;
  String categoryImage;

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(categoryName: "Automotive", categoryImage: 'assets/images/categories_images/automobile.png'),
    CategoriesModel(categoryName: "Electronics", categoryImage: 'assets/images/categories_images/electronic.png'),
    CategoriesModel(categoryName: "Real Estate", categoryImage: 'assets/images/categories_images/real_estate.png'),
    CategoriesModel(categoryName: "Furniture", categoryImage: 'assets/images/categories_images/furniture.png'),
    CategoriesModel(categoryName: "Tools and Equipments", categoryImage: 'assets/images/categories_images/tools_equipments.png'),
  ];

}
