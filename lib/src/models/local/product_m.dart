import 'dart:convert';

class ProductModel {
  const ProductModel({
    required this.name,
    required this.price,
    required this.amount,
  });

  final String name;
  final double price;
  final int amount;

  ProductModel copyWith({
    String? name,
    double? price,
    int? amount,
  }) {
    return ProductModel(
      name: name ?? this.name,
      price: price ?? this.price,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'amount': amount,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      price: map['price'],
      amount: map['amount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductModel(name: $name, price: $price, amount: $amount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel && other.name == name && other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ amount.hashCode;
}
