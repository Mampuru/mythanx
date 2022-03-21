import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.token,
    this.user,
  });

  String token;
  UserClass user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    user: UserClass.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class UserClass {
  UserClass({
    this.name,
    this.username,
    this.email,
    this.phone,
    this.country,
    this.createdAt,
    this.updatedAt,
  });

  String name;
  String username;
  dynamic email;
  dynamic phone;
  String country;
  String createdAt;
  String updatedAt;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    name: json["name"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    country: json["country"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "email": email,
    "phone": phone,
    "country": country,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
