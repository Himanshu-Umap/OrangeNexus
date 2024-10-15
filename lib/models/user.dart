class User {
  final String id;
  final String name;
  final String email;
  final bool isFarmer;

  User({required this.id, required this.name, required this.email, required this.isFarmer});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isFarmer: json['isFarmer'],
    );
  }
}