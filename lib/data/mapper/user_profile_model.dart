import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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
    required this.id,
    required this.name,
    required this.username,
    this.email,
    this.phone,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
    required this.metadata,
  });

  int id;
  String name;
  String username;
  dynamic email;
  dynamic phone;
  String country;
  String createdAt;
  String updatedAt;
  Metadata metadata;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    country: json["country"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    metadata: Metadata.fromJson(json["metadata"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "phone": phone,
    "country": country,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "metadata": metadata.toJson(),
  };
}

class Metadata {
  Metadata({
    required this.presence,
    required this.relationship,
  });

  Presence presence;
  Relationship relationship;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    presence: Presence.fromJson(json["presence"]),
    relationship: Relationship.fromJson(json["relationship"]),
  );

  Map<String, dynamic> toJson() => {
    "presence": presence.toJson(),
    "relationship": relationship.toJson(),
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
