class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;
  String? brand;
  String? createdAt;
  String? updatedAt;
  int? stock;
  int? quantity;

  ProductModel({
    this.name,
    this.description,
    this.image,
    this.price,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.stock,
    this.quantity,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    brand = json['brand'];
    quantity = json['quantity'];
    stock = json['stock'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['brand'] = brand;
    data['quantity'] = quantity;
    data['stock'] = stock;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
