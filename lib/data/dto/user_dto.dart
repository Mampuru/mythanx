import 'dart:convert';

UserDto userDtoFromJson(String str) => UserDto.fromJson(json.decode(str));

String userDtoToJson(UserDto data) => json.encode(data.toJson());

class UserDto {
  UserDto({
    this.name,
    this.username,
    this.email,
    this.phone,
    this.country,
    this.password,
  });

  String name;
  String username;
  String email;
  String phone;
  String country;
  String password;

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
    name: json["name"],
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    country: json["country"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "username": username,
    "email": email,
    "phone": phone,
    "country": country,
    "password": password,
  };
}
