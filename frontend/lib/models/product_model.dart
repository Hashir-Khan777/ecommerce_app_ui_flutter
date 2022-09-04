class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;
  String? brand;
  String? createdAt;
  String? updatedAt;

  ProductModel({
    this.name,
    this.description,
    this.image,
    this.price,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    brand = json['brand'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
