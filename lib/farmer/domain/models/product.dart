// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    List<Product> data;

    Products({
        required this.data,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Product {
    int id;
    String name;
    double price;
    String description;
    int storeId;
    int categoryId;
    String calcType;
    DateTime createdAt;
    DateTime updatedAt;

    Product({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.storeId,
        required this.categoryId,
        required this.calcType,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        storeId: json["store_id"],
        categoryId: json["category_id"],
        calcType: json["calc_type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "store_id": storeId,
        "category_id": categoryId,
        "calc_type": calcType,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
