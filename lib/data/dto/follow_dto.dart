import 'dart:convert';

FollowDto followDtoFromJson(String str) => FollowDto.fromJson(json.decode(str));

String followDtoToJson(FollowDto data) => json.encode(data.toJson());

class FollowDto {
  FollowDto({
    this.id,
    this.name,
    this.image,
    this.username,
    this.follow,
    this.follower,
  });

  String? id;
  String? name;
  String? image;
  String? username;
  bool? follow;
  bool? follower;

  factory FollowDto.fromJson(Map<String, dynamic> json) => FollowDto(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    username: json["username"],
    follow: json["follow"],
    follower: json["follower"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "username": username,
    "follow": follow,
    "follower": follower,
  };
}