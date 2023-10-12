class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? image;
  bool? hot;

  Product(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.image,
        this.hot});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    image = json['image'];
    hot = json['hot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    data['hot'] = hot;
    return data;
  }
}