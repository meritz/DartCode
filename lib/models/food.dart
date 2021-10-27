class Food {
  String itemName;
  String img;
  int totalQty;
  int price;
  String id;

  Food(this.id, this.itemName, this.totalQty, this.price);

  Food.fromMap(Map<String, dynamic> data) {
    itemName = data['itemName'];
    img = data['img'];
    totalQty = data['totalQty'];
    price = data['price'];
  }

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'img': img,
      'totalQty': totalQty,
      'price': price,
    };
  }
}
