class UserModel {
  var id;
  var name;
  var gender;
  var email;
  var password;
  var image;
  var token;
  var createdAt;
  var updatedAt;

  UserModel(
      {this.name,
      this.gender,
      this.image,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.id,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    password = json['password'];
    gender = json['gender'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
