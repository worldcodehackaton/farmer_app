import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  List<Basket> basket;

  Cart({
    required this.basket,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        basket: List<Basket>.from(json["basket"].map((x) => Basket.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "basket": List<dynamic>.from(basket.map((x) => x.toJson())),
      };
}

class Basket {
  int storeId;
  int clientId;
  int productId;
  int? count;
  int? weight;
  String type;

  Basket({
    required this.storeId,
    required this.clientId,
    required this.productId,
    this.count,
    this.weight = 1,
    this.type = 'RETAIL',
  });

  factory Basket.fromJson(Map<String, dynamic> json) => Basket(
        storeId: json["store_id"],
        clientId: json["client_id"],
        productId: json["product_id"],
        count: json["count"],
        weight: json["weight"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "client_id": clientId,
        "product_id": productId,
        "count": count,
        "weight": weight,
        "type": type,
      };
}
