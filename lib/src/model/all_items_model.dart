class AllItemsModel {
  AllItemsModel({
    required this.itemName,
    required this.itemRent,
    required this.itemImagePath,
  });

  final String itemName;
  final String itemRent;
  final String itemImagePath;

  static List<AllItemsModel> allItemsList = [
    AllItemsModel(itemName: 'MacBook Air M2', itemRent: 'PKR 1200 /day', itemImagePath: 'assets/images/all_item_images/MacBook.jpg'),
    AllItemsModel(itemName: 'Cyclopes 150Ti', itemRent: 'PKR 250 /day', itemImagePath: 'assets/images/all_item_images/bicycle.jpg'),

  ];

}
