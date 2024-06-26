import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.message,
    required this.data,
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
    required this.token,
    required this.user,
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
    required this.name,
    required this.username,
    required this.country,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.metadata,
  });

  String name;
  String username;
  Country country;
  String updatedAt;
  String createdAt;
  int id;
  Metadata metadata;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    name: json["name"],
    username: json["username"],
    country: Country.fromJson(json["country"]),
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],
    id: json["id"],
    metadata: Metadata.fromJson(json["metadata"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "country": country.toJson(),
    "updated_at": updatedAt,
    "created_at": createdAt,
    "id": id,
    "metadata": metadata.toJson(),
  };
}

class Country {
  Country({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}

class Metadata {
  Metadata({
    required this.relationship,
    required this.presence,
  });

  Relationship relationship;
  Presence presence;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    relationship: Relationship.fromJson(json["relationship"]),
    presence: Presence.fromJson(json["presence"]),
  );

  Map<String, dynamic> toJson() => {
    "relationship": relationship.toJson(),
    "presence": presence.toJson(),
  };
}

class Presence {
  Presence({
    required this.followers,
    required this.following,
  });

  int followers;
  int following;

  factory Presence.fromJson(Map<String, dynamic> json) => Presence(
    followers: json["followers"],
    following: json["following"],
  );

  Map<String, dynamic> toJson() => {
    "followers": followers,
    "following": following,
  };
}

class Relationship {
  Relationship({
    required this.followed,
    required this.follows,
  });

  bool followed;
  bool follows;

  factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
    followed: json["followed"],
    follows: json["follows"],
  );

  Map<String, dynamic> toJson() => {
    "followed": followed,
    "follows": follows,
  };
}