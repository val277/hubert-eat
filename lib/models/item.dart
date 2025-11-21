class Item {
  final int itemID;
  final String itemName;
  final String itemDescription;
  final double itemPrice;
  final String restaurantName;
  final int restaurantID;
  final String imageUrl;

  Item({
    required this.itemID,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.restaurantName,
    required this.restaurantID,
    required this.imageUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemID: json["itemID"],
      itemName: json["itemName"],
      itemDescription: json["itemDescription"],
      itemPrice: json["itemPrice"],
      restaurantName: json["restaurantName"],
      restaurantID: json["restaurantID"],
      imageUrl: json["imageUrl"],
    );
  }
}
