// File: lib/models/product.dart
class Product {
  final String id;
  final String name;
  final double quantity;
  final double price;
  final String farmerId;
  final String? description;
  final DateTime? harvestDate;
  final String status;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.farmerId,
    this.description,
    this.harvestDate,
    this.status = 'Waiting',
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'].toDouble(),
      price: json['price'].toDouble(),
      farmerId: json['farmerId'],
      description: json['description'],
      harvestDate: json['harvestDate'] != null 
          ? DateTime.parse(json['harvestDate']) 
          : null,
      status: json['status'] ?? 'Waiting',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'farmerId': farmerId,
      'description': description,
      'harvestDate': harvestDate?.toIso8601String(),
      'status': status,
    };
  }

  Product copyWith({
    String? id,
    String? name,
    double? quantity,
    double? price,
    String? farmerId,
    String? description,
    DateTime? harvestDate,
    String? status,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      farmerId: farmerId ?? this.farmerId,
      description: description ?? this.description,
      harvestDate: harvestDate ?? this.harvestDate,
      status: status ?? this.status,
    );
  }
}