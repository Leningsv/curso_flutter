// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String id;
  String title;
  double value;
  bool isAvailability;
  String urlPicture;

  ProductModel({
    this.id,
    this.title = '',
    this.value = 0.0,
    this.isAvailability = true,
    this.urlPicture,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => new ProductModel(
    id: json["id"],
    title: json["title"],
    value: json["value"],
    isAvailability: json["isAvailability"],
    urlPicture: json["urlPicture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "value": value,
    "isAvailability": isAvailability,
    "urlPicture": urlPicture,
  };
}
