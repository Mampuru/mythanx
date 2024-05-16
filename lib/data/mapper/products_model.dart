import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    this.createdAt,
    this.updatedAt,
    this.name,
    this.sku,
    this.description,
    this.amount,
    this.lineItem,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? sku;
  String? description;
  double? amount;
  List<LineItem>? lineItem;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    sku: json["sku"],
    description: json["description"],
    amount: json["amount"],
    lineItem: List<LineItem>.from(json["line_item"].map((x) => LineItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "name": name,
    "sku": sku,
    "description": description,
    "amount": amount,
    "line_item": List<dynamic>.from(lineItem!.map((x) => x.toJson())),
  };
}

class LineItem {
  LineItem({
    this.id,
    this.name,
    this.quantity,
    this.amount,
    this.total,
  });

  String? id;
  String? name;
  int? quantity;
  double? amount;
  double? total;

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
    id: json["id"],
    name: json["name"],
    quantity: json["quantity"],
    amount: json["amount"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "quantity": quantity,
    "amount": amount,
    "total": total,
  };
}
