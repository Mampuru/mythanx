import 'dart:convert';

CountryDto countryDtoFromJson(String str) => CountryDto.fromJson(json.decode(str));

String countryDtoToJson(CountryDto data) => json.encode(data.toJson());

class CountryDto {
  CountryDto({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory CountryDto.fromJson(Map<String, dynamic> json) => CountryDto(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.code,
    this.phone,
  });

  int? id;
  String? name;
  String? code;
  String? phone;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "phone": phone,
  };
}