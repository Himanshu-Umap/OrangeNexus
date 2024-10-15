class Product {
  final String id;
  final String name;
  final double quantity;
  final double price;
  final String farmerId;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.farmerId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
      farmerId: json['farmerId'],
    );
  }
}